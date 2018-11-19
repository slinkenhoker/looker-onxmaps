view: subscription_plan {
  sql_table_name: stripe.subscription_plan ;;

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: plan_id {
    type: string
    sql: ${TABLE}.plan_id ;;
  }

  dimension: subscription_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.subscription_id ;;
  }

  measure: count {
    type: count
    drill_fields: [subscriptions.id]
  }
}
