<#import "parts/common.ftl" as c />

<@c.page>
<div class="row mb-3">
        <form method="get" action="/main" class="row row-cols-lg-auto g-3 align-items-center">
            <div class="col-12"><input type="text" name="filter" value="${filter?ifExists}" class="form-control" placeholder="Search by tag"/> </div> <!---->
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
</div>

<#include "parts/messageEdit.ftl" />

<#include "parts/messageList.ftl" />

</@c.page>