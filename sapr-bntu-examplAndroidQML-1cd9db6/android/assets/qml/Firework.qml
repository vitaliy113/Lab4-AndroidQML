import Qt 4.7
import Qt.labs.particles 1.0

Particles
{
    id: particles

    width: 1;
    height: 1;

    anchors.centerIn: parent

    emissionRate: 0
    lifeSpan: 700;
    lifeSpanDeviation: 600
    angle: 0;
    angleDeviation: 360;
    velocity: 100;
    velocityDeviation: 30;

    source: randomImage();

    function randomImage()
    {
    var images = ["red.png", "blue.png", "green.png", "white.png", "yellow.png"];

	var idx = Math.floor((Math.random() * 100)) % images.length;

	return ("Stars/" + images[idx]);
    }
}
