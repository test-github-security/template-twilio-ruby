##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Insights
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Insights < InsightsBase
            class V1 < Version
                class CallList < ListResource
                    ##
                    # Initialize the CallList
                    # @param [Version] version Version that contains the resource
                    # @return [CallList] CallList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Insights.V1.CallList>'
                    end
                end


                class CallContext < InstanceContext
                    ##
                    # Initialize the CallContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid 
                    # @return [CallContext] CallContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Voice/#{@solution[:sid]}"

                        # Dependents
                        @metrics = nil
                        @events = nil
                        @summary = nil
                        @annotation = nil
                    end
                    ##
                    # Fetch the CallInstance
                    # @return [CallInstance] Fetched CallInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        CallInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the metrics
                    # @return [MetricList]
                    # @return [MetricContext]
                    def metrics
                      unless @metrics
                        @metrics = MetricList.new(
                                @version, call_sid: @solution[:sid], )
                      end
                      @metrics
                    end
                    ##
                    # Access the events
                    # @return [EventList]
                    # @return [EventContext]
                    def events
                      unless @events
                        @events = EventList.new(
                                @version, call_sid: @solution[:sid], )
                      end
                      @events
                    end
                    ##
                    # Access the summary
                    # @return [CallSummaryList]
                    # @return [CallSummaryContext]
                    def summary
                        CallSummaryContext.new(
                                @version,
                                @solution[:sid]
                                )
                    end
                    ##
                    # Access the annotation
                    # @return [AnnotationList]
                    # @return [AnnotationContext]
                    def annotation
                        AnnotationContext.new(
                                @version,
                                @solution[:sid]
                                )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Insights.V1.CallContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Insights.V1.CallContext #{context}>"
                    end
                end

                class CallPage < Page
                    ##
                    # Initialize the CallPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [CallPage] CallPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of CallInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [CallInstance] CallInstance
                    def get_instance(payload)
                        CallInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Insights.V1.CallPage>'
                    end
                end
                class CallInstance < InstanceResource
                    ##
                    # Initialize the CallInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Call
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [CallInstance] CallInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [CallContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = CallContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] 
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] 
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Fetch the CallInstance
                    # @return [CallInstance] Fetched CallInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Access the metrics
                    # @return [metrics] metrics
                    def metrics
                        context.metrics
                    end

                    ##
                    # Access the events
                    # @return [events] events
                    def events
                        context.events
                    end

                    ##
                    # Access the summary
                    # @return [summary] summary
                    def summary
                        context.summary
                    end

                    ##
                    # Access the annotation
                    # @return [annotation] annotation
                    def annotation
                        context.annotation
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Insights.V1.CallInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Insights.V1.CallInstance #{values}>"
                    end
                end

            end
        end
    end
end