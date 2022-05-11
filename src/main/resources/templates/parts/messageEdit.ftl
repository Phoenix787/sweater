<a class="btn btn-primary mb-3" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
   aria-controls="collapseExample">
    Message Editor
</a>
<div class="collapse <#if message??>show</#if>" id="collapseExample">

    <form method="post" enctype="multipart/form-data" class="mt-3 mb-3">
        <div class="mb-3">
            <input type="text" name="text" value="<#if message??> ${message.text}</#if>"
                   class="form-control  ${(textError??)?string('is-invalid', '')}" placeholder="Введите сообщение"/>
            <#if textError??>
                <div class="invalid-feedback">
                    ${textError}
                </div>
            </#if>
        </div>
        <div class="mb-3">
            <input type="text" name="tag" value="<#if message??>${message.tag}</#if>"
                   class="form-control ${(tagError??)?string('is-invalid', '')}" placeholder="Тэг">
            <#if tagError??>
                <div class="invalid-feedback">
                    ${tagError}
                </div>
            </#if>
        </div>
        <div class="mb-3">
            <input class="form-control" type="file" id="formFile" name="file">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="hidden" name="id" value="<#if message??>${message.id}</#if>"/>
        <div class="mb-3">
            <button type="submit" class="btn btn-primary">Сохранить сообщение</button>
        </div>
    </form>
</div>