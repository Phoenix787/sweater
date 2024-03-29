<#include "security.ftl">

<div class="row" data-masonry='{"percentPosition": true}'>
    <#list messages as message>
    <div class="col-sm-6 col-lg-4 mb-4">
        <div class="card p-3">
            <div>
                <#if message.filename??><img src="/img/${message.filename}" class="card-img-top"/></#if>
        </div>
        <div class="card-body m-2">
            <span class="card-text">${message.text}</span><br>
            <i>#${message.tag}</i>
        </div>

        <div class="card-footer">
            <a href="/user-messages/${message.author.id}" >${message.authorName}</a>
            <#if message.author.id == currentUserId>
                <a href="/user-messages/${message.author.id}?message=${message.id}" class="btn btn-primary">
                    Edit
                </a>
            </#if>
        </div>
    </div>
</div>
<#else>
No messages

</#list>
</div>