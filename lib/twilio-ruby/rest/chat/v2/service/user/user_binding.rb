##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Chat
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Chat < ChatBase
            class V2 < Version
                class ServiceContext < InstanceContext
                class UserContext < InstanceContext

                     class UserBindingList < ListResource
                    ##
                    # Initialize the UserBindingList
                    # @param [Version] version Version that contains the resource
                    # @return [UserBindingList] UserBindingList
                    def initialize(version, service_sid: nil, user_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid, user_sid: user_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/Users/#{@solution[:user_sid]}/Bindings"
                        
                    end
                
                    ##
                    # Lists UserBindingInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Array[BindingType]] binding_type The push technology used by the User Binding resources to read. Can be: `apn`, `gcm`, or `fcm`.  See [push notification configuration](https://www.twilio.com/docs/chat/push-notification-configuration) for more info.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(binding_type: :unset, limit: nil, page_size: nil)
                        self.stream(
                            binding_type: binding_type,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Array[BindingType]] binding_type The push technology used by the User Binding resources to read. Can be: `apn`, `gcm`, or `fcm`.  See [push notification configuration](https://www.twilio.com/docs/chat/push-notification-configuration) for more info.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(binding_type: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            binding_type: binding_type,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields UserBindingInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of UserBindingInstance records from the API.
                    # Request is executed immediately.
                    # @param [Array[BindingType]] binding_type The push technology used by the User Binding resources to read. Can be: `apn`, `gcm`, or `fcm`.  See [push notification configuration](https://www.twilio.com/docs/chat/push-notification-configuration) for more info.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of UserBindingInstance
                    def page(binding_type: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'BindingType' =>  Twilio.serialize_list(binding_type) { |e| e },
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        UserBindingPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of UserBindingInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of UserBindingInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    UserBindingPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Chat.V2.UserBindingList>'
                    end
                end


                class UserBindingContext < InstanceContext
                    ##
                    # Initialize the UserBindingContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) to fetch the User Binding resource from.
                    # @param [String] user_sid The SID of the [User](https://www.twilio.com/docs/chat/rest/user-resource) with the User Binding resource to fetch.  See [push notification configuration](https://www.twilio.com/docs/chat/push-notification-configuration) for more info.
                    # @param [String] sid The SID of the User Binding resource to fetch.
                    # @return [UserBindingContext] UserBindingContext
                    def initialize(version, service_sid, user_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, user_sid: user_sid, sid: sid,  }
                        @uri = "/Services/#{@solution[:service_sid]}/Users/#{@solution[:user_sid]}/Bindings/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the UserBindingInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the UserBindingInstance
                    # @return [UserBindingInstance] Fetched UserBindingInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        UserBindingInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            user_sid: @solution[:user_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Chat.V2.UserBindingContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Chat.V2.UserBindingContext #{context}>"
                    end
                end

                class UserBindingPage < Page
                    ##
                    # Initialize the UserBindingPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [UserBindingPage] UserBindingPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of UserBindingInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [UserBindingInstance] UserBindingInstance
                    def get_instance(payload)
                        UserBindingInstance.new(@version, payload, service_sid: @solution[:service_sid], user_sid: @solution[:user_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Chat.V2.UserBindingPage>'
                    end
                end
                class UserBindingInstance < InstanceResource
                    ##
                    # Initialize the UserBindingInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this UserBinding
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [UserBindingInstance] UserBindingInstance
                    def initialize(version, payload , service_sid: nil, user_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'service_sid' => payload['service_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'endpoint' => payload['endpoint'],
                            'identity' => payload['identity'],
                            'user_sid' => payload['user_sid'],
                            'credential_sid' => payload['credential_sid'],
                            'binding_type' => payload['binding_type'],
                            'message_types' => payload['message_types'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'user_sid' => user_sid  || @properties['user_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [UserBindingContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = UserBindingContext.new(@version , @params['service_sid'], @params['user_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the User Binding resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the User Binding resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the User Binding resource is associated with.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The unique endpoint identifier for the User Binding. The format of the value depends on the `binding_type`.
                    def endpoint
                        @properties['endpoint']
                    end
                    
                    ##
                    # @return [String] The application-defined string that uniquely identifies the resource's [User](https://www.twilio.com/docs/chat/rest/user-resource) within the [Service](https://www.twilio.com/docs/chat/rest/service-resource). See [access tokens](https://www.twilio.com/docs/chat/create-tokens) for more info.
                    def identity
                        @properties['identity']
                    end
                    
                    ##
                    # @return [String] The SID of the [User](https://www.twilio.com/docs/chat/rest/user-resource) with the User Binding resource.  See [push notification configuration](https://www.twilio.com/docs/chat/push-notification-configuration) for more info.
                    def user_sid
                        @properties['user_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Credential](https://www.twilio.com/docs/chat/rest/credential-resource) for the binding. See [push notification configuration](https://www.twilio.com/docs/chat/push-notification-configuration) for more info.
                    def credential_sid
                        @properties['credential_sid']
                    end
                    
                    ##
                    # @return [BindingType] 
                    def binding_type
                        @properties['binding_type']
                    end
                    
                    ##
                    # @return [Array<String>] The [Programmable Chat message types](https://www.twilio.com/docs/chat/push-notification-configuration#push-types) the binding is subscribed to.
                    def message_types
                        @properties['message_types']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the User Binding resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Delete the UserBindingInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the UserBindingInstance
                    # @return [UserBindingInstance] Fetched UserBindingInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Chat.V2.UserBindingInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Chat.V2.UserBindingInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end


