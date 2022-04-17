# Elixir SDK Library for ExOAPI.Stripe

This library was a generated as a test using the ExOAPI lib from the Stripe OpenAPI V3 spec.

For the small use I've put it through, it seems to work fine, but is nowhere tested appropriately and needs feedback from direct usage.

ExOAPI is still being developed and doesn't cover everything the OpenAPI 3 spec covers as of now, but works enough for most specs I've thrown at it. The `Client` module still needs work to allow more (or better, easier) customisation. It uses `Tesla` underneath so you can configure any other HTTP adapter to be used for the HTTP calls.

## Stripe API
<br/>
"The Stripe REST API. Please see https://stripe.com/docs/api for more details."
<br/>
**TODO: Add description**

## Installation

[available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `:exoapi_stripe` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:exoapi_stripe, "~> 0.1.3"}
  ]
end
```

## Usage

```elixir

client = ExOAPI.Stripe.new("sk_test_435466365......")
# ...
%ExOAPI.Client{
  adapter: nil,
  base_url: nil,
  body: nil,
  errors: [],
  headers: [
    {"Authorization", "Basic sdjffjg........="}
  ],
  method: nil,
  middleware: [
    {Tesla.Middleware.FollowRedirects, [max_redirects: 5]},
    {Tesla.Middleware.Timeout, [timeout: 15000]}
  ],
  module: nil,
  oapi_op: nil,
  opts: [],
  outgoing_format: "application/json",
  path: nil,
  query: [],
  replacements: [],
  response_handler: &ExOAPI.Client.response_handler/2,
  strict_responses: false
}

ExOAPI.Stripe.SDK.Files.get_files(client, purpose: "business_logo")

{:ok,
 %{
   "data" => [
     %ExOAPI.Stripe.Schemas.File{
       created: 1650153925,
       expires_at: nil,
       filename: "wood-background.jpg",
       id: "file_1KpLcHsSDF1X3pzkYj4emyD2f",
       links: %{
         "data" => [],
         "has_more" => false,
         "object" => "list",
         "url" => "/v1/file_links?file=file_1KpLcHsSDF1X3pzkYj4emyD2f"
       },
       object: :file,
       purpose: :business_logo,
       size: 25447,
       title: nil,
       type: "jpg",
       url: "https://files.stripe.com/v1/files/file_1KpLcHsSDF1X3pzkYj4emyD2f/contents"
     },
     %ExOAPI.Stripe.Schemas.File{
       created: 1650152610,
       expires_at: nil,
       filename: "wood-background-2.jpg",
       id: "file_1KpLH4G7R1Z3ApzkYNe3ZMfBw",
       links: %{
         "data" => [],
         "has_more" => false,
         "object" => "list",
         "url" => "/v1/file_links?file=file_1KpLH4G7R1Z3ApzkYNe3ZMfBw"
       },
       object: :file,
       purpose: :business_logo,
       size: 15447,
       title: nil,
       type: "jpg",
       url: "https://files.stripe.com/v1/files/file_1KpLH4G7R1Z3ApzkYNe3ZMfBw/contents"
     }
   ],
   "has_more" => false,
   "object" => "list",
   "url" => "/v1/files"
 }}

```
