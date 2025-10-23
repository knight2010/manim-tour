FROM manimcommunity/manim:v0.19.0

USER root
RUN pip install notebook
RUN pip install texlive-lang-chinese matplotlib reactive_manim

ARG NB_USER=manimuser
USER ${NB_USER}

COPY --chown=manimuser:manimuser . /manim
