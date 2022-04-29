<#import "/parts/common.ftl" as c>

<@c.page>
<h5>${username}</h5>
${message?ifExists}
<form method="post">
    <div class="g-3">

        <div class="mb-3">
            <div class="col-4">
                <label for="password" class="col-form-label"> Password: </label>
            </div>
            <div class="col-4">
                <input type="password" name="password" id="password" class="form-control" placeholder="Password"/>
            </div>
        </div>

        <div class="mb-3">
            <div class="col-4">
                <label for="email" class="col-form-label"> Email: </label>
            </div>
            <div class="col-4">
                <input type="text" name="email" id="email" class="form-control" value="${email!''}" />
            </div>
        </div>

    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
<button type="submit" class="btn btn-primary">Save</button>
</div>
</form>
</@c.page>