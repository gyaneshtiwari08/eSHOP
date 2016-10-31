
<div class="modal signUpContent fade" id="ModalLogin" tabindex="-1"
	role="dialog">
	<div class="modal-dialog ">
		<form role="form" action="login" method="post">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h3 class="modal-title-site text-center">Login to TSHOP</h3>
			</div>
			<div class="modal-body">
				<div class="form-group login-username">
					<div>
						<input id="login-user" class="form-control input" name="username"
							size="20" placeholder="Username" type="text">
					</div>
				</div>
				<div class="form-group login-password">
					<div>
						<input id="login-password" name="password"
							class="form-control input" size="20" placeholder="Password"
							type="password">
					</div>
				</div>
				<div class="form-group">
					<div>
						<div class="checkbox login-remember">
							<label> <input name="rememberme" value="forever"
								checked="checked" type="checkbox"> Remember Me
							</label>
						</div>
					</div>
				</div>
				<div>
					<div>
						<input name="submit" class="btn  btn-block btn-lg btn-primary"
							value="LOGIN" type="submit">
					</div>
				</div>
				<!--userForm-->

			</div>
			<div class="modal-footer">
				<p class="text-center">
					Not here before? <a data-toggle="modal" data-dismiss="modal"
						href="#ModalSignup"> Sign Up. </a> <br> <a
						href="forgot-password"> Lost your password? </a>
				</p>
			</div>
		</div>
		</form>
		<!-- /.modal-content -->

	</div>
	<!-- /.modal-dialog -->

</div>