require 'active_support/configurable'
require 'active_support/inflector'
require 'faraday'
require 'json'
require 'roar/decorator'
require 'roar/representer/json'

require 'contactually/version'
require 'contactually/errors'
require 'contactually/utils'

require 'contactually/middleware/error_detector'

require 'contactually/representer/grouping_representer'
require 'contactually/representer/account_representer'
require 'contactually/representer/bucket_representer'
require 'contactually/representer/contact_representer'
require 'contactually/representer/interaction_representer'
require 'contactually/representer/content_representer'
require 'contactually/representer/grouping_statistic_representer'
require 'contactually/representer/note_representer'
require 'contactually/representer/task_representer'

require 'contactually/api'
require 'contactually/groupings'
require 'contactually/contacts'
require 'contactually/buckets'
require 'contactually/interactions'
require 'contactually/notes'
require 'contactually/contact_groupings'
require 'contactually/accounts'
require 'contactually/contents'
require 'contactually/tasks'

module Contactually
  include ActiveSupport::Configurable

  config_accessor(:access_token)
  config_accessor(:contactually_url) { "https://api.contactually.com/v2/" }
end
