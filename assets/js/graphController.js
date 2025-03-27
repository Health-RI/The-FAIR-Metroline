
// make a graph visible
function showGraph(graphId) {
    hideGraphs()
    document.getElementById(graphId).style.display = "block";
}

// hides all graphs
function hideGraphs(){
    const children = document.querySelector("#graph-container").children;
    for (let i = 0; i < children.length; i++) {
        children[i].style.display = "none";
    }
}

// set the initial visibility. Used as part of window.onload to ensure graphs are rendered first; otherwise altering
// visibility may fail
function initGraphs(graphVisibility) {
    console.log({graphVisibility})
    const children = document.querySelector("#graph-container").children;
    const invisibleGraphs = Object.keys(graphVisibility).filter(graph => !graphVisibility[graph]);

    invisibleGraphs.forEach(graph => {
//    graphVisibility.forEach(graph => {
        console.log(`Initializing ${graph}`);
        // Add your graph initialization logic here
        document.getElementById(graph).style.display = "None";
    });
}
