/* Set the width of the side navigation to 250px and the left margin of the page content to 250px and add a black background color to body */
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("mySidenav").style.display = "block";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0, and the background color of body to white */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.body.style.backgroundColor = "white";
}

$("document").ready(function (){
    $("#search_button").click(function () {
        $(".dialog").show();
        $("#search_input").val("");
    });
    $(".closeDialog").click(function () {
        $(".dialog").hide();
    });
    $("#button_dialog_notebook").click(function () {
        var data = $("#name_notebook").val();
        $("#search_input").val(data);
        $(".dialog").hide();
    });
});

