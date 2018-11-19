connection: "onx_fivetran_bigquery"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: customers {
  label: "Subscriptions Analytics"
  description: "This is to analyze subscriptions of our customers"
  join: subscriptions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${customers.id} = ${subscriptions.customer} ;;
  }
  join: subscription_plan {
    type: left_outer
    relationship: one_to_one
    sql_on: ${subscription_plan.plan_id} = ${subscriptions.plan_id} ;;
  }

}
