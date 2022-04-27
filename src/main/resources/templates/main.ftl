<#import "parts/common.ftl" as c />

<@c.page>
<div class="row mb-3">
        <form method="get" action="/main" class="row row-cols-lg-auto g-3 align-items-center">
            <div class="col-12"><input type="text" name="filter" value="${filter?ifExists}" class="form-control" placeholder="Search by tag"/> </div> <!---->
            <type="submit" class="btn btn-primary">Search</button>
        </form>
</div>
<a class="btn btn-primary mb-3" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new message
</a>
<div class="collapse" id="collapseExample">

    <form method="post" enctype="multipart/form-data" class="mt-3 mb-3">
        <div class="mb-3"><input type="text" name="text" class="form-control" placeholder="Введите сообщение" /></div>
        <div class="mb-3"><input type="text" name="tag"  class="form-control" placeholder="Тэг"></div>
        <div class="mb-3">

            <input class="form-control" type="file" id="formFile">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="mb-3"><button type="submit" class="btn btn-primary">Добавить</button></div>
    </form>

</div>
<div class="row row-cols-1 row-cols-md-3 g-4">
        <#list messages as message>
        <div class="card my-3" style="max-width: 18rem;">
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
    <#else>
    No messages
    </#list>
</div>

</@c.page>