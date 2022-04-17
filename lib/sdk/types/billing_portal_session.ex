defmodule ExOAPI.Stripe.Schemas.BillingPortal_session do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: The Billing customer portal is a Stripe-hosted UI for subscription and
  billing management.

  A portal configuration describes the functionality and features that you
  want to provide to your customers through the portal.

  A portal session describes the instantiation of the customer portal for
  a particular customer. By visiting the session's URL, the customer
  can manage their subscriptions and billing details. For security reasons,
  sessions are short-lived and will expire if the customer does not visit the URL.
  Create sessions on-demand when customers intend to manage their subscriptions
  and billing details.

  Learn more in the [integration guide](https://stripe.com/docs/billing/subscriptions/integrating-customer-portal).

  **:configuration** :: *ExOAPI.Stripe.Schemas.BillingPortal_configuration | :string*

  The configuration used by this session, describing the features available.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:customer** :: *ExOAPI.Stripe.Schemas.Customer*

  The ID of the customer for this session.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:locale** :: *:string*

  The IETF language tag of the locale Customer Portal is displayed in. If blank or auto, the customer’s `preferred_locales` or browser’s locale is used.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:on_behalf_of** :: *:string*

  The account for which the session was created on behalf of. When specified, only subscriptions and invoices with this `on_behalf_of` account appear in the portal. For more information, see the [docs](https://stripe.com/docs/connect/charges-transfers#on-behalf-of). Use the [Accounts API](https://stripe.com/docs/api/accounts/object#account_object-settings-branding) to modify the `on_behalf_of` account's branding settings, which the portal displays.


  **:return_url** :: *:string*

  The URL to redirect customers to when they click on the portal's link to return to your website.


  **:url** :: *:string*

  The short-lived URL of the session that gives customers access to the customer portal.


  """

  @primary_key false
  typed_embedded_schema do
    field(:configuration, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.BillingPortal_configuration]
    )

    field(:created, :integer)

    field(:customer, :string)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:locale, Ecto.Enum,
      values: [
        :"zh-TW",
        :"zh-HK",
        :zh,
        :vi,
        :tr,
        :th,
        :sv,
        :sl,
        :sk,
        :ru,
        :ro,
        :"pt-BR",
        :pt,
        :pl,
        :nl,
        :nb,
        :mt,
        :ms,
        :lv,
        :lt,
        :ko,
        :ja,
        :it,
        :id,
        :hu,
        :hr,
        :"fr-CA",
        :fr,
        :fil,
        :fi,
        :et,
        :"es-419",
        :es,
        :"en-SG",
        :"en-NZ",
        :"en-IN",
        :"en-IE",
        :"en-GB",
        :"en-CA",
        :"en-AU",
        :en,
        :el,
        :de,
        :da,
        :cs,
        :bg,
        :auto
      ]
    )

    field(:object, Ecto.Enum, values: [:"billing_portal.session"])

    field(:on_behalf_of, :string)

    field(:return_url, :string)

    field(:url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :url,
      :return_url,
      :on_behalf_of,
      :object,
      :locale,
      :livemode,
      :id,
      :customer,
      :created,
      :configuration
    ])
    |> validate_required([
      :url,
      :return_url,
      :object,
      :livemode,
      :id,
      :customer,
      :created,
      :configuration
    ])
  end
end