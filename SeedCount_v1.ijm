//Seed Counter for seeds (or darker than background objects) on white surfaces
//Have a file/stack open or import

//Prepare work image
name = getTitle();
getSelectionBounds(x, y, width, height)
run("Duplicate...", " ");
dupliname = getTitle();
roiManager("Reset");
//treshold and distance mapping to find seed midpoints
run("8-bit");
run("Subtract Background...", "rolling=150 light");
run("Gaussian Blur...", "sigma=2");
setAutoThreshold("Otsu");
setOption("BlackBackground", false);
run("Convert to Mask");
run("8-bit");
run("Distance Map");
run("Find Maxima...", "noise=5 output=Count light");
//Add found maxima to ROI manager to show
run("Find Maxima...", "noise=5 output=[Point Selection] light");
roiManager("Add");
//Clean up and add selection overlay to source image
close (dupliname);
selectWindow(name);
roiManager("Select", 0);
roiManager("translate", x, y)
exit();
//end
