let video;
let yolo;
let status;
let objects = [];
let typesOfThings = ['person', 
  'bicycle', 
  'car', 
  'motorbike', 
  'aeroplane', 
  'bus', 
  'train', 
  'truck', 
  'boat', 
  'traffic light', 
  'fire hydrant', 
  'stop sign', 
  'parking meter', 
  'bench', 
  'bird', 
  'cat', 
  'dog', 
  'horse', 
  'sheep', 
  'cow', 
  'elephant', 
  'bear', 
  'zebra', 
  'giraffe', 
  'backpack', 
  'umbrella', 
  'handbag', 
  'tie', 
  'suitcase', 
  'frisbee', 
  'skis', 
  'snowboard', 
  'sports ball', 
  'kite', 
  'baseball bat', 
  'baseball glove', 
  'skateboard', 
  'surfboard', 
  'tennis racket', 
  'bottle', 
  'wine glass', 
  'cup', 
  'fork', 
  'knife', 
  'spoon', 
  'bowl', 
  'banana', 
  'apple', 
  'sandwich', 
  'orange', 
  'broccoli', 
  'carrot', 
  'hot dog', 
  'pizza', 
  'donut', 
  'cake', 
  'chair', 
  'sofa', 
  'pottedplant', 
  'bed', 
  'diningtable', 
  'toilet', 
  'tvmonitor', 
  'laptop', 
  'mouse', 
  'remote', 
  'keyboard', 
  'cell phone', 
  'microwave', 
  'oven', 
  'toaster', 
  'sink', 
  'refrigerator', 
  'book', 
  'clock', 
  'vase', 
  'scissors', 
  'teddy bear', 
  'hair drier', 
  'toothbrush'];
let menu;
let choice ='';
let timestamp;
var interval = 5000;
var lastGrab = 0;

function setup() {
  createCanvas(640, 480);
  video = createCapture(VIDEO);
  menu = createSelect(); // creates a drop menu 
  menu.position(600, 10); // where the menu lives
  // Create a YOLO method
  yolo = ml5.YOLO(video, startDetecting);

  // Hide the original video
  video.hide();
  status = select('#status');

  //populate the array
  for (var i = 0; i < typesOfThings.length; i++) {
    menu.option(typesOfThings[i]);
  }
  menu.changed(subject);
}

function draw() {
  image(video, 0, 0, 640, 480);
  for (let i = 0; i < objects.length; i++) {
    if (objects[i].className == choice) {
      found();
      if (millis() - lastGrab > interval) {
        timestamp = Math.round(new Date().getTime()/1000);
        let filename = choice + '_' + timestamp+'.jpg';
        save(filename);
        lastGrab = millis();
      }
    }
  }
}

function subject() {
  choice = menu.value();
}

function startDetecting() {
  status.html('Model loaded!');
  detect();
}

function found() {
  status.html('Found a '+choice);
}

function detect() {
  yolo.detect(function(err, results) {
    objects = results;
    detect();
  } );
}