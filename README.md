# A statistics lesson from the Higgs discovery

This project is an exercise on advanced statistics that originates from the real world problem of particle phenomenology. The roadmap to obtain the resulting inference is as follows:

  1. _Simulation_: this is the stage in which major physics was needed. We focused only on the di-gamma end state. Without getting into much of the technical details, we utilized bash scripting to run MadGraph as needed and generate <span>10<sup>6</sup></span> background events (SM without Higgs) at each invariant mass; <span>10<sup>6</sup></span> signal events (with unknown Higgs mass); and, to emulate the observed line, generated more <span>10<sup>6</sup></span> events for each bin of the &gamma;&gamma; invariant mass with assuming a 125 GeV Higgs. The model is implemented into MadGraph through a UFO generated with the help of FeynArts, and the implementation of the NLO effective H&gamma;&gamma; vertex is taken from PLACEHOLDER. 
