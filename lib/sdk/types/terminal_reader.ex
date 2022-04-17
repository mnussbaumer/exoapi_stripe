defmodule ExOAPI.Stripe.Schemas.Terminal_reader do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A Reader represents a physical device for accepting payment details.

  Related guide: [Connecting to a Reader](https://stripe.com/docs/terminal/payments/connect-reader).

  **:action** :: *ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceReaderAction*

  The most recent action performed by the reader.


  **:device_sw_version** :: *:string*

  The current software version of the reader.


  **:device_type** :: *:string*

  Type of reader, one of `bbpos_wisepad3`, `stripe_m2`, `bbpos_chipper2x`, `bbpos_wisepos_e`, or `verifone_P400`.


  **:id** :: *:string*

  Unique identifier for the object.


  **:ip_address** :: *:string*

  The local IP address of the reader.


  **:label** :: *:string*

  Custom label given to the reader for easier identification.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:location** :: *ExOAPI.Stripe.Schemas.Terminal_location | :string*

  The location identifier of the reader.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:serial_number** :: *:string*

  Serial number of the reader.


  **:status** :: *:string*

  The networking status of the reader.


  """

  @primary_key false
  typed_embedded_schema do
    field(:action, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceReaderAction]
    )

    field(:device_sw_version, :string)

    field(:device_type, Ecto.Enum,
      values: [:verifone_P400, :stripe_m2, :bbpos_wisepos_e, :bbpos_wisepad3, :bbpos_chipper2x]
    )

    field(:id, :string)

    field(:ip_address, :string)

    field(:label, :string)

    field(:livemode, :boolean)

    field(:location, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Terminal_location]
    )

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:"terminal.reader"])

    field(:serial_number, :string)

    field(:status, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :status,
      :serial_number,
      :object,
      :metadata,
      :location,
      :livemode,
      :label,
      :ip_address,
      :id,
      :device_type,
      :device_sw_version,
      :action
    ])
    |> validate_required([
      :serial_number,
      :object,
      :metadata,
      :livemode,
      :label,
      :id,
      :device_type
    ])
  end
end