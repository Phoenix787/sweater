<#import "parts/common.ftl" as c />

<@c.page>
<div class="row mb-3">
        <form method="get" action="/main" class="row row-cols-lg-auto g-3 align-items-center">
            <div class="col-12"><input type="text" name="filter" value="${filter?ifExists}" class="form-control" placeholder="Search by tag"/> </div> <!---->
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
</div>
<a class="btn btn-primary mb-3" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new message
</a>
<div class="collapse <#if message??>show</#if>" id="collapseExample">

    <form method="post" enctype="multipart/form-data" class="mt-3 mb-3">
        <div class="mb-3">
            <input type="text" name="text" value="<#if message??> ${message.text}</#if>" class="form-control  ${(textError??)?string('is-invalid', '')}" placeholder="Введите сообщение" />
            <#if textError??>
            <div class="invalid-feedback">
                ${textError}
            </div>
            </#if>
        </div>
        <div class="mb-3">
            <input type="text" name="tag"  value="<#if message??>${message.tag}</#if>" class="form-control ${(tagError??)?string('is-invalid', '')}" placeholder="Тэг">
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
        <div class="mb-3"><button type="submit" class="btn btn-primary">Добавить</button></div>
    </form>

</div>
<div class="row" data-masonry='{"percentPosition": true}'>
        <#list messages as message>
            <div class="col-sm-6 col-lg-4 mb-4">
                <div class="card p-3">
                        <div>
                            <#if message.filename??><img src="/img/${message.filename}" class="card-img-top"/></#if>
                        </div>
                        <div class="card-body m-2">
                            <span class="card-text">${message.text}</span>
                            <i>${message.tag}</i>
                        </div>

                        <div class="card-footer">
                        ${message.authorName}
                        </div>
                </div>
            </div>
                <#else>
                No messages

    </#list>
</div>

</@c.page>