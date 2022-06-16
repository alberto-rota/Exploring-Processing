class Fluid {
  PVector location;
  float w;
  float h;
  float coeff;

  Fluid(PVector l, float wi, float he, float co) {
    location = l;kk;
    w = wi;
    h = he;
    coeff = co;
  }

  boolean affects(Mass corpse) {
    boolean ok = false;
    if (corpse.location.x<this.location.x+w/2) {
      if (corpse.location.x>this.location.x-w/2) {
        if (corpse.location.y<this.location.y+2*h/2) {
          if (corpse.location.y>this.location.y-h/2) {
            ok = true;
          }
        }
      }
    }
    return ok;
  }


  void drag(Mass corpse) {
    PVector drag = corpse.velocity.get();
    drag.setMag(-coeff*pow(corpse.velocity.mag(), 2));
    corpse.applyForce((drag));
    drawVector(drag, corpse.location,#0000ff);
  }

  void display() {
    rectMode(CENTER);
    noStroke();
    fill(#77B4F5);
    rect(location.x, location.y, w, h);
  }
}
