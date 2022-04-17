defmodule ExOAPI.Stripe.SDK.WebhookEndpoints do
  @doc """
  **description**: <p>You can also delete webhook endpoints via the <a href="https://dashboard.stripe.com/account/webhooks">webhook endpoint management</a> page of the Stripe dashboard.</p>

  """

  @spec delete_webhook_endpoints_webhook_endpoint(
          client :: ExOAPI.Client.t(),
          body :: %{} | map(),
          webhook_endpoint :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.DeletedWebhookEndpoint.t()
           | map()}
          | {:error, any()}
  def delete_webhook_endpoints_webhook_endpoint(%ExOAPI.Client{} = client, body, webhook_endpoint) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/webhook_endpoints/{webhook_endpoint}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("webhook_endpoint", webhook_endpoint)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the webhook endpoint. You may edit the <code>url</code>, the list of <code>enabled_events</code>, and the status of your endpoint.</p>

  """

  @spec post_webhook_endpoints_webhook_endpoint(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :url => String.t(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :enabled_events => [
                String.t()
                | :*
                | :"account.application.authorized"
                | :"account.application.deauthorized"
                | :"account.external_account.created"
                | :"account.external_account.deleted"
                | :"account.external_account.updated"
                | :"account.updated"
                | :"application_fee.created"
                | :"application_fee.refund.updated"
                | :"application_fee.refunded"
                | :"balance.available"
                | :"billing_portal.configuration.created"
                | :"billing_portal.configuration.updated"
                | :"capability.updated"
                | :"cash_balance.funds_available"
                | :"charge.captured"
                | :"charge.dispute.closed"
                | :"charge.dispute.created"
                | :"charge.dispute.funds_reinstated"
                | :"charge.dispute.funds_withdrawn"
                | :"charge.dispute.updated"
                | :"charge.expired"
                | :"charge.failed"
                | :"charge.pending"
                | :"charge.refund.updated"
                | :"charge.refunded"
                | :"charge.succeeded"
                | :"charge.updated"
                | :"checkout.session.async_payment_failed"
                | :"checkout.session.async_payment_succeeded"
                | :"checkout.session.completed"
                | :"checkout.session.expired"
                | :"coupon.created"
                | :"coupon.deleted"
                | :"coupon.updated"
                | :"credit_note.created"
                | :"credit_note.updated"
                | :"credit_note.voided"
                | :"customer.created"
                | :"customer.deleted"
                | :"customer.discount.created"
                | :"customer.discount.deleted"
                | :"customer.discount.updated"
                | :"customer.source.created"
                | :"customer.source.deleted"
                | :"customer.source.expiring"
                | :"customer.source.updated"
                | :"customer.subscription.created"
                | :"customer.subscription.deleted"
                | :"customer.subscription.pending_update_applied"
                | :"customer.subscription.pending_update_expired"
                | :"customer.subscription.trial_will_end"
                | :"customer.subscription.updated"
                | :"customer.tax_id.created"
                | :"customer.tax_id.deleted"
                | :"customer.tax_id.updated"
                | :"customer.updated"
                | :"file.created"
                | :"identity.verification_session.canceled"
                | :"identity.verification_session.created"
                | :"identity.verification_session.processing"
                | :"identity.verification_session.redacted"
                | :"identity.verification_session.requires_input"
                | :"identity.verification_session.verified"
                | :"invoice.created"
                | :"invoice.deleted"
                | :"invoice.finalization_failed"
                | :"invoice.finalized"
                | :"invoice.marked_uncollectible"
                | :"invoice.paid"
                | :"invoice.payment_action_required"
                | :"invoice.payment_failed"
                | :"invoice.payment_succeeded"
                | :"invoice.sent"
                | :"invoice.upcoming"
                | :"invoice.updated"
                | :"invoice.voided"
                | :"invoiceitem.created"
                | :"invoiceitem.deleted"
                | :"invoiceitem.updated"
                | :"issuing_authorization.created"
                | :"issuing_authorization.request"
                | :"issuing_authorization.updated"
                | :"issuing_card.created"
                | :"issuing_card.updated"
                | :"issuing_cardholder.created"
                | :"issuing_cardholder.updated"
                | :"issuing_dispute.closed"
                | :"issuing_dispute.created"
                | :"issuing_dispute.funds_reinstated"
                | :"issuing_dispute.submitted"
                | :"issuing_dispute.updated"
                | :"issuing_transaction.created"
                | :"issuing_transaction.updated"
                | :"mandate.updated"
                | :"order.created"
                | :"order.payment_failed"
                | :"order.payment_succeeded"
                | :"order.updated"
                | :"order_return.created"
                | :"payment_intent.amount_capturable_updated"
                | :"payment_intent.canceled"
                | :"payment_intent.created"
                | :"payment_intent.partially_funded"
                | :"payment_intent.payment_failed"
                | :"payment_intent.processing"
                | :"payment_intent.requires_action"
                | :"payment_intent.succeeded"
                | :"payment_link.created"
                | :"payment_link.updated"
                | :"payment_method.attached"
                | :"payment_method.automatically_updated"
                | :"payment_method.detached"
                | :"payment_method.updated"
                | :"payout.canceled"
                | :"payout.created"
                | :"payout.failed"
                | :"payout.paid"
                | :"payout.updated"
                | :"person.created"
                | :"person.deleted"
                | :"person.updated"
                | :"plan.created"
                | :"plan.deleted"
                | :"plan.updated"
                | :"price.created"
                | :"price.deleted"
                | :"price.updated"
                | :"product.created"
                | :"product.deleted"
                | :"product.updated"
                | :"promotion_code.created"
                | :"promotion_code.updated"
                | :"quote.accepted"
                | :"quote.canceled"
                | :"quote.created"
                | :"quote.finalized"
                | :"radar.early_fraud_warning.created"
                | :"radar.early_fraud_warning.updated"
                | :"recipient.created"
                | :"recipient.deleted"
                | :"recipient.updated"
                | :"reporting.report_run.failed"
                | :"reporting.report_run.succeeded"
                | :"reporting.report_type.updated"
                | :"review.closed"
                | :"review.opened"
                | :"setup_intent.canceled"
                | :"setup_intent.created"
                | :"setup_intent.requires_action"
                | :"setup_intent.setup_failed"
                | :"setup_intent.succeeded"
                | :"sigma.scheduled_query_run.created"
                | :"sku.created"
                | :"sku.deleted"
                | :"sku.updated"
                | :"source.canceled"
                | :"source.chargeable"
                | :"source.failed"
                | :"source.mandate_notification"
                | :"source.refund_attributes_required"
                | :"source.transaction.created"
                | :"source.transaction.updated"
                | :"subscription_schedule.aborted"
                | :"subscription_schedule.canceled"
                | :"subscription_schedule.completed"
                | :"subscription_schedule.created"
                | :"subscription_schedule.expiring"
                | :"subscription_schedule.released"
                | :"subscription_schedule.updated"
                | :"tax_rate.created"
                | :"tax_rate.updated"
                | :"terminal.reader.action_failed"
                | :"terminal.reader.action_succeeded"
                | :"test_helpers.test_clock.advancing"
                | :"test_helpers.test_clock.created"
                | :"test_helpers.test_clock.deleted"
                | :"test_helpers.test_clock.internal_failure"
                | :"test_helpers.test_clock.ready"
                | :"topup.canceled"
                | :"topup.created"
                | :"topup.failed"
                | :"topup.reversed"
                | :"topup.succeeded"
                | :"transfer.created"
                | :"transfer.failed"
                | :"transfer.paid"
                | :"transfer.reversed"
                | :"transfer.updated"
              ],
              :disabled => boolean(),
              :description => String.t()
            }
            | map(),
          webhook_endpoint :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.WebhookEndpoint.t() | map()}
          | {:error, any()}
  def post_webhook_endpoints_webhook_endpoint(%ExOAPI.Client{} = client, body, webhook_endpoint) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/webhook_endpoints/{webhook_endpoint}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("webhook_endpoint", webhook_endpoint)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the webhook endpoint with the given ID.</p>

  """
  @type get_webhook_endpoints_webhook_endpoint_opts :: {:expand, String.t()}
  @spec get_webhook_endpoints_webhook_endpoint(
          client :: ExOAPI.Client.t(),
          webhook_endpoint :: String.t(),
          list(get_webhook_endpoints_webhook_endpoint_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.WebhookEndpoint.t() | map()}
          | {:error, any()}
  def get_webhook_endpoints_webhook_endpoint(
        %ExOAPI.Client{} = client,
        webhook_endpoint,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/webhook_endpoints/{webhook_endpoint}")
    |> ExOAPI.Client.replace_in_path("webhook_endpoint", webhook_endpoint)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>A webhook endpoint must have a <code>url</code> and a list of <code>enabled_events</code>. You may optionally specify the Boolean <code>connect</code> parameter. If set to true, then a Connect webhook endpoint that notifies the specified <code>url</code> about events from all connected accounts is created; otherwise an account webhook endpoint that notifies the specified <code>url</code> only about events from your account is created. You can also create webhook endpoints in the <a href="https://dashboard.stripe.com/account/webhooks">webhooks settings</a> section of the Dashboard.</p>

  """

  @spec post_webhook_endpoints(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :url => String.t(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :enabled_events => [
                String.t()
                | :*
                | :"account.application.authorized"
                | :"account.application.deauthorized"
                | :"account.external_account.created"
                | :"account.external_account.deleted"
                | :"account.external_account.updated"
                | :"account.updated"
                | :"application_fee.created"
                | :"application_fee.refund.updated"
                | :"application_fee.refunded"
                | :"balance.available"
                | :"billing_portal.configuration.created"
                | :"billing_portal.configuration.updated"
                | :"capability.updated"
                | :"cash_balance.funds_available"
                | :"charge.captured"
                | :"charge.dispute.closed"
                | :"charge.dispute.created"
                | :"charge.dispute.funds_reinstated"
                | :"charge.dispute.funds_withdrawn"
                | :"charge.dispute.updated"
                | :"charge.expired"
                | :"charge.failed"
                | :"charge.pending"
                | :"charge.refund.updated"
                | :"charge.refunded"
                | :"charge.succeeded"
                | :"charge.updated"
                | :"checkout.session.async_payment_failed"
                | :"checkout.session.async_payment_succeeded"
                | :"checkout.session.completed"
                | :"checkout.session.expired"
                | :"coupon.created"
                | :"coupon.deleted"
                | :"coupon.updated"
                | :"credit_note.created"
                | :"credit_note.updated"
                | :"credit_note.voided"
                | :"customer.created"
                | :"customer.deleted"
                | :"customer.discount.created"
                | :"customer.discount.deleted"
                | :"customer.discount.updated"
                | :"customer.source.created"
                | :"customer.source.deleted"
                | :"customer.source.expiring"
                | :"customer.source.updated"
                | :"customer.subscription.created"
                | :"customer.subscription.deleted"
                | :"customer.subscription.pending_update_applied"
                | :"customer.subscription.pending_update_expired"
                | :"customer.subscription.trial_will_end"
                | :"customer.subscription.updated"
                | :"customer.tax_id.created"
                | :"customer.tax_id.deleted"
                | :"customer.tax_id.updated"
                | :"customer.updated"
                | :"file.created"
                | :"identity.verification_session.canceled"
                | :"identity.verification_session.created"
                | :"identity.verification_session.processing"
                | :"identity.verification_session.redacted"
                | :"identity.verification_session.requires_input"
                | :"identity.verification_session.verified"
                | :"invoice.created"
                | :"invoice.deleted"
                | :"invoice.finalization_failed"
                | :"invoice.finalized"
                | :"invoice.marked_uncollectible"
                | :"invoice.paid"
                | :"invoice.payment_action_required"
                | :"invoice.payment_failed"
                | :"invoice.payment_succeeded"
                | :"invoice.sent"
                | :"invoice.upcoming"
                | :"invoice.updated"
                | :"invoice.voided"
                | :"invoiceitem.created"
                | :"invoiceitem.deleted"
                | :"invoiceitem.updated"
                | :"issuing_authorization.created"
                | :"issuing_authorization.request"
                | :"issuing_authorization.updated"
                | :"issuing_card.created"
                | :"issuing_card.updated"
                | :"issuing_cardholder.created"
                | :"issuing_cardholder.updated"
                | :"issuing_dispute.closed"
                | :"issuing_dispute.created"
                | :"issuing_dispute.funds_reinstated"
                | :"issuing_dispute.submitted"
                | :"issuing_dispute.updated"
                | :"issuing_transaction.created"
                | :"issuing_transaction.updated"
                | :"mandate.updated"
                | :"order.created"
                | :"order.payment_failed"
                | :"order.payment_succeeded"
                | :"order.updated"
                | :"order_return.created"
                | :"payment_intent.amount_capturable_updated"
                | :"payment_intent.canceled"
                | :"payment_intent.created"
                | :"payment_intent.partially_funded"
                | :"payment_intent.payment_failed"
                | :"payment_intent.processing"
                | :"payment_intent.requires_action"
                | :"payment_intent.succeeded"
                | :"payment_link.created"
                | :"payment_link.updated"
                | :"payment_method.attached"
                | :"payment_method.automatically_updated"
                | :"payment_method.detached"
                | :"payment_method.updated"
                | :"payout.canceled"
                | :"payout.created"
                | :"payout.failed"
                | :"payout.paid"
                | :"payout.updated"
                | :"person.created"
                | :"person.deleted"
                | :"person.updated"
                | :"plan.created"
                | :"plan.deleted"
                | :"plan.updated"
                | :"price.created"
                | :"price.deleted"
                | :"price.updated"
                | :"product.created"
                | :"product.deleted"
                | :"product.updated"
                | :"promotion_code.created"
                | :"promotion_code.updated"
                | :"quote.accepted"
                | :"quote.canceled"
                | :"quote.created"
                | :"quote.finalized"
                | :"radar.early_fraud_warning.created"
                | :"radar.early_fraud_warning.updated"
                | :"recipient.created"
                | :"recipient.deleted"
                | :"recipient.updated"
                | :"reporting.report_run.failed"
                | :"reporting.report_run.succeeded"
                | :"reporting.report_type.updated"
                | :"review.closed"
                | :"review.opened"
                | :"setup_intent.canceled"
                | :"setup_intent.created"
                | :"setup_intent.requires_action"
                | :"setup_intent.setup_failed"
                | :"setup_intent.succeeded"
                | :"sigma.scheduled_query_run.created"
                | :"sku.created"
                | :"sku.deleted"
                | :"sku.updated"
                | :"source.canceled"
                | :"source.chargeable"
                | :"source.failed"
                | :"source.mandate_notification"
                | :"source.refund_attributes_required"
                | :"source.transaction.created"
                | :"source.transaction.updated"
                | :"subscription_schedule.aborted"
                | :"subscription_schedule.canceled"
                | :"subscription_schedule.completed"
                | :"subscription_schedule.created"
                | :"subscription_schedule.expiring"
                | :"subscription_schedule.released"
                | :"subscription_schedule.updated"
                | :"tax_rate.created"
                | :"tax_rate.updated"
                | :"terminal.reader.action_failed"
                | :"terminal.reader.action_succeeded"
                | :"test_helpers.test_clock.advancing"
                | :"test_helpers.test_clock.created"
                | :"test_helpers.test_clock.deleted"
                | :"test_helpers.test_clock.internal_failure"
                | :"test_helpers.test_clock.ready"
                | :"topup.canceled"
                | :"topup.created"
                | :"topup.failed"
                | :"topup.reversed"
                | :"topup.succeeded"
                | :"transfer.created"
                | :"transfer.failed"
                | :"transfer.paid"
                | :"transfer.reversed"
                | :"transfer.updated"
              ],
              :description => String.t(),
              :connect => boolean(),
              :api_version =>
                String.t()
                | :"2011-01-01"
                | :"2011-06-21"
                | :"2011-06-28"
                | :"2011-08-01"
                | :"2011-09-15"
                | :"2011-11-17"
                | :"2012-02-23"
                | :"2012-03-25"
                | :"2012-06-18"
                | :"2012-06-28"
                | :"2012-07-09"
                | :"2012-09-24"
                | :"2012-10-26"
                | :"2012-11-07"
                | :"2013-02-11"
                | :"2013-02-13"
                | :"2013-07-05"
                | :"2013-08-12"
                | :"2013-08-13"
                | :"2013-10-29"
                | :"2013-12-03"
                | :"2014-01-31"
                | :"2014-03-13"
                | :"2014-03-28"
                | :"2014-05-19"
                | :"2014-06-13"
                | :"2014-06-17"
                | :"2014-07-22"
                | :"2014-07-26"
                | :"2014-08-04"
                | :"2014-08-20"
                | :"2014-09-08"
                | :"2014-10-07"
                | :"2014-11-05"
                | :"2014-11-20"
                | :"2014-12-08"
                | :"2014-12-17"
                | :"2014-12-22"
                | :"2015-01-11"
                | :"2015-01-26"
                | :"2015-02-10"
                | :"2015-02-16"
                | :"2015-02-18"
                | :"2015-03-24"
                | :"2015-04-07"
                | :"2015-06-15"
                | :"2015-07-07"
                | :"2015-07-13"
                | :"2015-07-28"
                | :"2015-08-07"
                | :"2015-08-19"
                | :"2015-09-03"
                | :"2015-09-08"
                | :"2015-09-23"
                | :"2015-10-01"
                | :"2015-10-12"
                | :"2015-10-16"
                | :"2016-02-03"
                | :"2016-02-19"
                | :"2016-02-22"
                | :"2016-02-23"
                | :"2016-02-29"
                | :"2016-03-07"
                | :"2016-06-15"
                | :"2016-07-06"
                | :"2016-10-19"
                | :"2017-01-27"
                | :"2017-02-14"
                | :"2017-04-06"
                | :"2017-05-25"
                | :"2017-06-05"
                | :"2017-08-15"
                | :"2017-12-14"
                | :"2018-01-23"
                | :"2018-02-05"
                | :"2018-02-06"
                | :"2018-02-28"
                | :"2018-05-21"
                | :"2018-07-27"
                | :"2018-08-23"
                | :"2018-09-06"
                | :"2018-09-24"
                | :"2018-10-31"
                | :"2018-11-08"
                | :"2019-02-11"
                | :"2019-02-19"
                | :"2019-03-14"
                | :"2019-05-16"
                | :"2019-08-14"
                | :"2019-09-09"
                | :"2019-10-08"
                | :"2019-10-17"
                | :"2019-11-05"
                | :"2019-12-03"
                | :"2020-03-02"
                | :"2020-08-27"
            }
            | map()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.WebhookEndpoint.t() | map()}
          | {:error, any()}
  def post_webhook_endpoints(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/webhook_endpoints")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your webhook endpoints.</p>

  """
  @type get_webhook_endpoints_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_webhook_endpoints(client :: ExOAPI.Client.t(), list(get_webhook_endpoints_opts())) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.WebhookEndpoint.t()]
             }
           | map()}
          | {:error, any()}
  def get_webhook_endpoints(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/webhook_endpoints")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end
end