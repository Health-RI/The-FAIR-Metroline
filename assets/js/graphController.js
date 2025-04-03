
// make a graph visible
function showGraph(graphId) {
    cur_element = document.getElementById(graphId)
    element_section = cur_element.getAttribute("section")
    hideGraphs(element_section)
    document.getElementById(graphId).style.display = "block";
}

// hides all graphs
function hideGraphs(element_section){
//    const children = document.querySelectorAll("#graph-container").children;
    const children = document.querySelectorAll('[section='+element_section+']');
    for (let i = 0; i < children.length; i++) {
        children[i].style.display = "none";
    }
}

// set the initial visibility. Used as part of window.onload to ensure graphs are rendered first; otherwise altering
// visibility may fail
function initGraphs(graphVisibility) {
    const children = document.querySelector(".mermaid");
    const invisibleGraphs = Object.keys(graphVisibility).filter(graph => !graphVisibility[graph]);

    invisibleGraphs.forEach(graph => {
        document.getElementById(graph).style.display = "None";
    });
}
