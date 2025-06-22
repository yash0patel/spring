
<!--**********************************
        Scripts
    ***********************************-->
<!-- Required vendors -->
<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>

<script src="./vendor/chartist/js/chartist.min.js"></script>

<script src="./vendor/moment/moment.min.js"></script>
<script src="./vendor/pg-calendar/js/pignose.calendar.min.js"></script>


<script src="./js/dashboard/dashboard-2.js"></script>

<script>
    function confirmLogout(userName) {
        if (confirm("Are you sure you want to logout, " + userName + "?")) {
            window.location.href = '<%=request.getContextPath()%>
	/logout.jsp';
		}
	}
</script>

<!-- Circle progress -->