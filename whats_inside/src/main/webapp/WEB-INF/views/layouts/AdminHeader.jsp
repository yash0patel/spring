<%@page import="com.bean.UserBean"%>
<%
UserBean user = (UserBean) session.getAttribute("user");
%>
<!--**********************************
    Header Start
***********************************-->
<div class="header">
	<div class="header-content">
		<nav class="navbar navbar-expand">
			<div class="collapse navbar-collapse justify-content-between">
				<div class="header-left">
					<!-- Left content if needed -->
				</div>

				<ul class="navbar-nav header-right">
					<%
					if (user != null) {
					%>
					<!-- User Logged In -->
					<li class="nav-item dropdown header-profile"><a
						class="nav-link" href="#" role="button" data-toggle="dropdown">
							<i class="mdi mdi-account"></i>
					</a>
						<div class="dropdown-menu dropdown-menu-right">
							<a href="profile" class="dropdown-item"> <i class="icon-user"></i>
								<span class="ml-2">Profile</span>
							</a> <a href="logout" class="dropdown-item"> <i
								class="ti-power-off"></i> <span class="ml-2">Logout</span>
							</a>
						</div></li>
					<%
					} else {
					%>
					<!-- User Not Logged In -->
					<li class="nav-item"><a
						class="btn btn-sm btn-outline-primary rounded-pill px-3 py-1 me-3"
						href="login"> <i class="mdi mdi-login"></i> Login
					</a></li>
					<li class="nav-item"><a
						class="btn btn-sm btn-outline-success rounded-pill px-3 py-1 me-2"
						href="signup"> <i class="mdi mdi-account-plus"></i> Sign
							Up
					</a></li>

					<%
					}
					%>
				</ul>
			</div>
		</nav>
	</div>
</div>
<!--**********************************
    Header End
***********************************-->
