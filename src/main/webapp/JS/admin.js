var a = 1;
var b = 0;

function navBarLoad() {
    if (a == 0) {
        document.getElementById("navBarSide").style.display = "inline-block";
        document.getElementById("sideNavBarDrawer").className = "navSmall";
        document.getElementById("MainPageContainer").className = "PageContainerSmall";
        document.getElementById("footer").className = "footerSmall";
        a = 1;
    } else {
        document.getElementById("navBarSide").style.display = "none";
        document.getElementById("sideNavBarDrawer").className = "navBig";
        document.getElementById("MainPageContainer").className = "PageContainerBig";
        document.getElementById("footer").className = "footerBig";
        a = 0;
    }
}

function dropDown1() {
    if (b == 0) {
        document.getElementById("dropDown1").style.display = "inline-block";
        b = 1;
    } else {
        document.getElementById("dropDown1").style.display = "none";
        b = 0;
    }
}

//Filter Table
function myFunction() {
    var input, filter, table, tr, td, i, txtValue, td1, td2;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("tableCustomerDetails");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[1];
        td1 = tr[i].getElementsByTagName("td")[2];
        td2 = tr[i].getElementsByTagName("td")[3];
        if (td) {
            txtValue = td.textContent || td.innerText;
            td1 = td1.textContent || td1.innerText;
            td2 = td2.textContent || td2.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else if (td1.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else if (td2.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}