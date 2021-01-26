<div id="case-caselink-events" class="crm-accordion-wrapper collapsed">

    <div class="crm-accordion-header">(E::ts('Related sub events'))</div>

    <div class="crm-accordion-body">
        {if $permission EQ 'edit'}
            <div class="action-link">
                {capture assign=newEventURL}{crmURL p="civicrm/event/add" q="reset=1&action=add&caselink_case_id=`$caseId`"}{/capture}
                <a accesskey="N" href="{$newEventURL}" class="button">
                    <span><div class="icon add-icon"></div>(E::ts('New related event'))</span>
                </a>
            </div>
        {/if}
        <table>
            <thead>
            <tr>
                <th class="ui-state-default">(E::ts('Start date'))</th>
                <th class="ui-state-default">(E::ts('Event type'))</th>
                <th class="ui-state-default">(E::ts('Title'))</th>
                <th class="no-sort ui-state-default"></th>
            </tr>
            </thead>
            <tbody>

            {foreach from=$events item=event}
                <tr class="{cycle values="odd,even"}">
                    <td>{$event.start_date|crmDate:"%b %d, %Y %l:%M %P"}</td>
                    <td>{$event.event_type}</td>
                    <td>{$event.title}</td>
                    <td>
                        <a href="{crmURL p="civicrm/event/manage/settings" q="action=update&reset=1&id=`$event.event_id`"}">(E::ts('Configure event'))
                    </td>
                </tr>
            {/foreach}
            </tbody>
        </table>

    </div>
</div>


<script type="text/javascript">
    {literal}
    cj(function() {
        var caselinkEvents = cj('#case-caselink-events').detach();
        cj('#case_custom_edit').before(caselinkEvents);
    });
    {/literal}
</script>
