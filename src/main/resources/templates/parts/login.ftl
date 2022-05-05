<#macro login path isRegisterForm>
<form action="${path}" method="post">
  <div class="g-3">
  <div class="mb-3">
    <div class="col-4">
      <label for="username" class="col-form-label"> User Name : </label>
    </div>
    <div class="col-4">
      <input type="text" name="username" id="username" value="<#if user??>${user.username}</#if>"
             class="form-control ${(usernameError??)?string('is-invalid', '')}"
             placeholder="Username"/>
      <#if usernameError??>
        <div class="invalid-feedback">
          ${usernameError}
        </div>
      </#if>
    </div>
  </div>
  <div class="mb-3">
    <div class="col-4">
      <label for="password" class="col-form-label"> Password: </label>
    </div>
    <div class="col-4">
      <input type="password" name="password" id="password" class="form-control ${(passwordError??)?string('is-invalid', '')}" placeholder="Password"/>
        <#if passwordError??>
          <div class="invalid-feedback">
            ${passwordError}
          </div>
      </#if>
    </div>
  </div>


    <#if isRegisterForm>
      <div class="mb-3">
        <div class="col-4">
          <label for="password2" class="col-form-label"> Confirm password: </label>
        </div>
        <div class="col-4">
          <input type="password" name="password2" id="password2" class="form-control ${(password2Error??)?string('is-invalid', '')}" placeholder="Retype password"/>
          <#if password2Error??>
          <div class="invalid-feedback">
            ${password2Error}
          </div>
        </#if>
      </div>
      </div>

      <div class="mb-3">
        <div class="col-4">
          <label for="email" class="col-form-label"> Email: </label>
        </div>
        <div class="col-4">
          <input type="text" name="email" id="email" value="<#if user??>${user.email}</#if>"
                 class="form-control ${(emailError??)?string('is-invalid', '')}"
                 placeholder="Email"/>
          <#if emailError??>
          <div class="invalid-feedback">
            ${emailError}
          </div>
        </#if>
        </div>
      </div>
    </#if>

    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <#if !isRegisterForm> <a href="/registration">Registration</a> </#if>
  <button type="submit" class="btn btn-primary"><#if isRegisterForm>Create<#else>Sign In</#if></button>
  </div>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
  <input type="hidden" name="_csrf" value="${_csrf.token}"/>
  <button type="submit" class="btn btn-primary">Выход</button>
</form>
</#macro>