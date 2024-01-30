##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Preview
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#

module Twilio
    module REST
        class Preview
            class HostedNumbers < Version
                ##
                # Initialize the HostedNumbers version of Preview
                def initialize(domain)
                    super
                    @version = 'HostedNumbers'
                    @authorization_documents = nil
                    @hosted_number_orders = nil
                end

                ##
                # @param [String] sid A 34 character string that uniquely identifies this AuthorizationDocument.
                # @return [Twilio::REST::Preview::HostedNumbers::AuthorizationDocumentContext] if sid was passed.
                # @return [Twilio::REST::Preview::HostedNumbers::AuthorizationDocumentList]
                def authorization_documents(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @authorization_documents ||= AuthorizationDocumentList.new self
                    else
                        AuthorizationDocumentContext.new(self, sid)
                    end
                end
                ##
                # @param [String] sid A 34 character string that uniquely identifies this HostedNumberOrder.
                # @return [Twilio::REST::Preview::HostedNumbers::HostedNumberOrderContext] if sid was passed.
                # @return [Twilio::REST::Preview::HostedNumbers::HostedNumberOrderList]
                def hosted_number_orders(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @hosted_number_orders ||= HostedNumberOrderList.new self
                    else
                        HostedNumberOrderContext.new(self, sid)
                    end
                end
                ##
                # Provide a user friendly representation
                def to_s
                    '<Twilio::REST::Preview::HostedNumbers>';
                end
            end
        end
    end
end