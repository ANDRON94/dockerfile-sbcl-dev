FROM andron94/dockerfile-quicksbcl:1.1.0
MAINTAINER Andrii Tymchuk <makedonsky94@gmail.com>

# ====================== Install Swank(SLIME backend) ==========================

# 1. Convenient definitions.
ENV SBCL_INIT_FILE .sbclrc

ENV SWANK_PORT 4005

# 2. Define script for Swank initialization:
#    - load Swank;
#    - create&run Swank server.
ENV SWANK_INIT_SCRIPT="\
(ql:quickload :swank)\n\
(swank-loader:init)\n\
(swank:create-server :interface \"0.0.0.0\" :port ${SWANK_PORT} :dont-close t)"

# 2. Installation:
#  1. Download and install Swank through Quicklisp.
#  2. Add Swank initialization script to SBCL startup script.
RUN sbcl --eval '(ql:quickload :swank)' \
         --eval '(quit)' &&\
    echo -e ${SWANK_INIT_SCRIPT} >> $HOME/${SBCL_INIT_FILE}

# ==============================================================================

# Allow 'world' connect to Swank.
EXPOSE ${SWANK_PORT}

CMD ["sbcl"]
