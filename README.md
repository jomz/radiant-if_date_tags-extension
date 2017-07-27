# If Date Tags

This Radiant CMS extension introduces four new radius tags that compare specified-on-tag and derived-from-page dates to expand or not expand depending on the outcome.

Examples:

Consider these tags implemented on a page with a published_at date of April 2nd, 2017.

    <r:if_date_earlier than="January 1 2017">Will not render because page.published_at is later</r:if_date_earlier>
    <r:if_date_earlier date="published_at" than="April 2 2017">Will not render because published_at is not earlier</r:if_date_earlier>
    <r:if_date_earlier date="published_at" than="April 2 2017" or_equal="true">Will render because published_at is equal</r:if_date_earlier>
    <r:unless_date_earlier than="April 2 2017">Will not render because published_at is not earlier</r:unless_date_earlier>
    <r:unless_date_earlier date="published_at" than="April 2 2017" or_equal="true">Will render because published_at is equal</r:unless_date_earlier>
    
    <r:if_date_later than="January 1 2017">Will render because implied published_at is later</r:if_date_later>
    <r:if_date_later date="published_at" than="March 10 2017">Will not render because published_at is not later</r:if_date_later>
    <r:if_date_later date="published_at" than="April 2 2017" or_equal="true">Will render because published_at is equal</r:if_date_later>
    <r:unless_date_later than="January 1 2017">Will not render because implied published_at is later</r:unless_date_later>
    <r:unless_date_later date="published_at" than="January 1 2017">Will not render because published_at is later</r:unless_date_later>

Created by Benny Degezelle for nzffa.org.nz 