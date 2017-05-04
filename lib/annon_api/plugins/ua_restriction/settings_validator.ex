defmodule Annon.Plugins.UARestriction.SettingsValidator do
  @moduledoc """
  Validation rules for UARestriction plugin settings.
  """
  import Annon.Helpers.JsonSchemaValidator

  def validate_settings(%Ecto.Changeset{} = changeset) do
    validate_with_json_schema(changeset, :settings, %{
      "type" => "object",
      "anyOf" => [
        %{"required" => ["whitelist", "blacklist"]},
        %{"required" => ["whitelist"]},
        %{"required" => ["blacklist"]}
      ],
      "additionalProperties" => false,
      "properties" => %{
        "whitelist" => %{
          "type" => "array",
          "items" => %{
            "type" => "string"
          }
        },
        "blacklist" => %{
          "type" => "array",
          "items" => %{
            "type" => "string"
          }
        }
      }
    })
  end
end
