#!/usr/bin/env bash
clear;

gnuplot pdf.hydrograph.gnuplot  && \
    pdflatex harvey_hcfcd_outflow_hydrograph.tex  && \
    rm harvey_hcfcd_outflow_hydrograph.tex  && \
    rm harvey_hcfcd_outflow_hydrograph-inc.pdf  && \
    rm harvey_hcfcd_outflow_hydrograph.aux  && \
    rm harvey_hcfcd_outflow_hydrograph.log
