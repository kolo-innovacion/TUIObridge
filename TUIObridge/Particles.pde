
import java.util.Locale;

import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.flowfieldparticles.DwFlowFieldParticles;
import com.thomasdiewald.pixelflow.java.imageprocessing.DwFlowField;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.DwFilter;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.Merge;

import processing.core.*;
import processing.opengl.PGraphics2D;

int viewport_w = 1280;
int viewport_h = 720;
int viewport_x = 230;
int viewport_y = 0;

PGraphics2D pg_canvas;
PGraphics2D pg_obstacles;

DwPixelFlow context;

DwFlowFieldParticles particles;
DwFlowField ff_acc;
