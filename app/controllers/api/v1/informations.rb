module API
  module V1
    class Informations < Grape::API
      include API::V1::Defaults

      resource :informations do
        desc "Return stored link and informations"
        get "/list" do
          Information.all
        end

        desc "Grab content from url and store them"
        params do
          requires :url, type: String, desc: "Give a valid url, exp: https://en.wikipedia.org/"
        end
        post "/grab_content" do
          contents = InformationSerializer.get_content permitted_params[:url]

          unless contents.empty?
            Information.create! url: permitted_params[:url], content: contents.join(" ")
          else
            error_data = {
              title: I18n.t("api.errors.title"),
              message: I18n.t("api.errors.msg")
            }

            error! error_data, :bad_request
          end
        end
      end
    end
  end
end
