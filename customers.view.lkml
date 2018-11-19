view: customers {
  sql_table_name: stripe.customers ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: _fivetran_synced {
    hidden: yes
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

  dimension: account_balance {
    type: number
    sql: ${TABLE}.account_balance ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created ;;
  }

  dimension: default_card {
    type: string
    sql: ${TABLE}.default_card ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}.deleted ;;
  }

  dimension: delinquent {
    type: yesno
    sql: ${TABLE}.delinquent ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: metadata_account_id {
    type: string
    sql: ${TABLE}.metadata_account_id ;;
  }

  dimension: metadata_address_country {
    type: string
    sql: ${TABLE}.metadata_address_country ;;
    map_layer_name: countries
  }

  dimension: metadata_address_postal_code {
    type: string
    sql: ${TABLE}.metadata_address_postal_code ;;
    map_layer_name: us_zipcode_tabulation_areas
  }

  dimension: metadata_state {
    type: string
    sql: ${TABLE}.metadata_state ;;
    map_layer_name: us_states
  }

  dimension_group: trial_end {
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
    sql: ${TABLE}.trial_end ;;
  }

  measure: count {
    type: count
    drill_fields: [email,metadata_state]
  }
}
