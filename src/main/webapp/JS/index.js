import defaultExport from "https: //cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js";
import defaultExport from "https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TimelineMax.min.js";
import defaultExport from "https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.6/ScrollMagic.min.js";
import defaultExport from "https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.6/plugins/animation.gsap.min.js";

var t1 = new TimelineMax({ onUpdate: updatePercentage() });
const controller = new ScrollMagic.Controller();