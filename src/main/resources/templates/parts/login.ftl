<#macro login path isRegisterForm>
<form action="${path}" method="post">
  <div class="g-3">
  <div class="mb-3">
    <div class="col-4">
      <label for="username" class="col-form-label"> User Name : </label>
    </div>
    <div class="col-4">
      <input type="text" name="username" id="username" class="form-control" placeholder="Username"/>
    </div>
  </div>
  <div class="mb-3">
    <div class="col-4">
      <label for="password" class="col-form-label"> Password: </label>
    </div>
    <div class="col-4">
      <input type="password" name="password" id="password" class="form-control" placeholder="Password"/>
    </div>
  </div>

    <#if isRegisterForm>
      <div class="mb-3">
        <div class="col-4">
          <label for="email" class="col-form-label"> Email: </label>
        </div>
        <div class="col-4">
          <input type="text" name="email" id="email" class="form-control" placeholder="Email"/>
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