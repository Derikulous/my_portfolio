var setupAnimate = function(){
  $('.animate').textillate({
  // the default selector to use when detecting multiple texts to animate
  selector: '.texts',
  // enable looping
  loop: false,
  // sets the minimum display time for each text before it is replaced
  minDisplayTime: 8000,
  // sets the initial delay before starting the animation
  // (note that depending on the in effect you may need to manually apply
  // visibility: hidden to the element before running this plugin)
  initialDelay: 0,
  // set whether or not to automatically start animating
  autoStart: true,

  // in animation settings
    in: {
    // set the effect name
    effect: 'bounceInDown',
    // set the delay factor applied to each consecutive character
    delayScale: 2,
    // set the delay between each character
    delay: 80,
    // set to true to animate all the characters at the same time
    sync: false,
    // randomize the character sequence
    // (note that shuffle doesn't make sense with sync = true)
    shuffle: false
    }
  });
  $('.about-section').textillate({
    selector: '.texts',
    loop: false,
    minDisplayTime: 3000,
    initialDelay: 2600,
    autoStart: true,

    in: {
      effect: 'flipInX',
      delayScale: 3,
      delay: 100,
      sync: true
    }
  });
  $('.photo-section').textillate({
    selector: '.texts',
    loop: false,
    minDisplayTime: 3000,
    initialDelay: 3000,
    autoStart: true,

    in: {
      effect: 'flipInX',
      delayScale: 3,
      delay: 100,
      sync: true
    }
  });
  $('.blog-section').textillate({
    selector: '.texts',
    loop: false,
    minDisplayTime: 3000,
    initialDelay: 3400,
    autoStart: true,

    in: {
      effect: 'flipInX',
      delayScale: 3,
      delay: 100,
      sync: true
    }
  });
};

$(document).ready(function() {
  $(".title").lettering('words')
  setupAnimate();
});

snowStorm.snowColor = '#fff';
snowStorm.animationInterval = 50;
snowStorm.flakesMaxActive = 25;
snowStorm.randomizeWind();
snowStorm.vMaxX = 4;
snowStorm.vMaxY = 2;
snowStorm.freezeOnBlur = true;
snowStorm.followMouse = false;
snowStorm.flakesMax = 50;
snowStorm.useTwinkleEffect = true;
