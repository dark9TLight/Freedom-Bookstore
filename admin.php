<?php
	$title = "Administration section";
	require_once "./template/header_login.php";
?>

	<form class="form-horizontal" method="post" action="admin_verify.php">
		<p style = "color : grey !important;text-align : center;">This page is only for admin. Click "Home" at navigation bar to be redirected to customer page. Thank you!</p>
		<h1 style = "color : black; text-align : center;">ADMIN LOGIN</h1>
		<div class="form-group">
			<label for="name" class="control-label col-md-4" >Username</label>
			<div class="col-md-4">
				<input type="text" name="name" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="pass" class="control-label col-md-4">Password</label>
			<div class="col-md-4">
				<input type="password" name="pass" class="form-control">
			</div>
		</div>
		<input type="submit" name="submit" class="btn btn-primary" style="margin-left: 45%!important; margin-right: 45%!important;">
	</form>
<?php
	require_once "./template/footer_login.php";
?>