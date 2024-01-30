##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Intelligence
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Intelligence < IntelligenceBase
            class V2 < Version
                class TranscriptContext < InstanceContext

                     class OperatorResultList < ListResource
                    ##
                    # Initialize the OperatorResultList
                    # @param [Version] version Version that contains the resource
                    # @return [OperatorResultList] OperatorResultList
                    def initialize(version, transcript_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { transcript_sid: transcript_sid }
                        @uri = "/Transcripts/#{@solution[:transcript_sid]}/OperatorResults"
                        
                    end
                
                    ##
                    # Lists OperatorResultInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Boolean] redacted Grant access to PII redacted/unredacted Language Understanding operator. If redaction is enabled, the default is True.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(redacted: :unset, limit: nil, page_size: nil)
                        self.stream(
                            redacted: redacted,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Boolean] redacted Grant access to PII redacted/unredacted Language Understanding operator. If redaction is enabled, the default is True.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(redacted: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            redacted: redacted,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields OperatorResultInstance records from the API.
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
                    # Retrieve a single page of OperatorResultInstance records from the API.
                    # Request is executed immediately.
                    # @param [Boolean] redacted Grant access to PII redacted/unredacted Language Understanding operator. If redaction is enabled, the default is True.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of OperatorResultInstance
                    def page(redacted: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Redacted' => redacted,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        OperatorResultPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of OperatorResultInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of OperatorResultInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    OperatorResultPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Intelligence.V2.OperatorResultList>'
                    end
                end


                ##
                #PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
                class OperatorResultContext < InstanceContext
                    ##
                    # Initialize the OperatorResultContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] transcript_sid A 34 character string that uniquely identifies this Transcript.
                    # @param [String] operator_sid A 34 character string that identifies this Language Understanding operator sid.
                    # @return [OperatorResultContext] OperatorResultContext
                    def initialize(version, transcript_sid, operator_sid)
                        super(version)

                        # Path Solution
                        @solution = { transcript_sid: transcript_sid, operator_sid: operator_sid,  }
                        @uri = "/Transcripts/#{@solution[:transcript_sid]}/OperatorResults/#{@solution[:operator_sid]}"

                        
                    end
                    ##
                    # Fetch the OperatorResultInstance
                    # @param [Boolean] redacted Grant access to PII redacted/unredacted Language Understanding operator. If redaction is enabled, the default is True.
                    # @return [OperatorResultInstance] Fetched OperatorResultInstance
                    def fetch(
                        redacted: :unset
                    )

                        params = Twilio::Values.of({
                            'Redacted' => redacted,
                        })
                        payload = @version.fetch('GET', @uri, params: params)
                        OperatorResultInstance.new(
                            @version,
                            payload,
                            transcript_sid: @solution[:transcript_sid],
                            operator_sid: @solution[:operator_sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Intelligence.V2.OperatorResultContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Intelligence.V2.OperatorResultContext #{context}>"
                    end
                end

                class OperatorResultPage < Page
                    ##
                    # Initialize the OperatorResultPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [OperatorResultPage] OperatorResultPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of OperatorResultInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [OperatorResultInstance] OperatorResultInstance
                    def get_instance(payload)
                        OperatorResultInstance.new(@version, payload, transcript_sid: @solution[:transcript_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Intelligence.V2.OperatorResultPage>'
                    end
                end
                class OperatorResultInstance < InstanceResource
                    ##
                    # Initialize the OperatorResultInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this OperatorResult
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [OperatorResultInstance] OperatorResultInstance
                    def initialize(version, payload , transcript_sid: nil, operator_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'operator_type' => payload['operator_type'],
                            'name' => payload['name'],
                            'operator_sid' => payload['operator_sid'],
                            'extract_match' => payload['extract_match'],
                            'match_probability' => payload['match_probability'],
                            'normalized_result' => payload['normalized_result'],
                            'utterance_results' => payload['utterance_results'],
                            'utterance_match' => payload['utterance_match'],
                            'predicted_label' => payload['predicted_label'],
                            'predicted_probability' => payload['predicted_probability'],
                            'label_probabilities' => payload['label_probabilities'],
                            'extract_results' => payload['extract_results'],
                            'text_generation_results' => payload['text_generation_results'],
                            'transcript_sid' => payload['transcript_sid'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'transcript_sid' => transcript_sid  || @properties['transcript_sid']  ,'operator_sid' => operator_sid  || @properties['operator_sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [OperatorResultContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = OperatorResultContext.new(@version , @params['transcript_sid'], @params['operator_sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [OperatorType] 
                    def operator_type
                        @properties['operator_type']
                    end
                    
                    ##
                    # @return [String] The name of the applied Language Understanding.
                    def name
                        @properties['name']
                    end
                    
                    ##
                    # @return [String] A 34 character string that identifies this Language Understanding operator sid.
                    def operator_sid
                        @properties['operator_sid']
                    end
                    
                    ##
                    # @return [Boolean] Boolean to tell if extract Language Understanding Processing model matches results.
                    def extract_match
                        @properties['extract_match']
                    end
                    
                    ##
                    # @return [Float] Percentage of 'matching' class needed to consider a sentence matches
                    def match_probability
                        @properties['match_probability']
                    end
                    
                    ##
                    # @return [String] Normalized output of extraction stage which matches Label.
                    def normalized_result
                        @properties['normalized_result']
                    end
                    
                    ##
                    # @return [Array<Hash>] List of mapped utterance object which matches sentences.
                    def utterance_results
                        @properties['utterance_results']
                    end
                    
                    ##
                    # @return [Boolean] Boolean to tell if Utterance matches results.
                    def utterance_match
                        @properties['utterance_match']
                    end
                    
                    ##
                    # @return [String] The 'matching' class. This might be available on conversation classify model outputs.
                    def predicted_label
                        @properties['predicted_label']
                    end
                    
                    ##
                    # @return [Float] Percentage of 'matching' class needed to consider a sentence matches.
                    def predicted_probability
                        @properties['predicted_probability']
                    end
                    
                    ##
                    # @return [Hash] The labels probabilities. This might be available on conversation classify model outputs.
                    def label_probabilities
                        @properties['label_probabilities']
                    end
                    
                    ##
                    # @return [Hash] List of text extraction results. This might be available on classify-extract model outputs.
                    def extract_results
                        @properties['extract_results']
                    end
                    
                    ##
                    # @return [Hash] Output of a text generation operator for example Conversation Sumamary.
                    def text_generation_results
                        @properties['text_generation_results']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies this Transcript.
                    def transcript_sid
                        @properties['transcript_sid']
                    end
                    
                    ##
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the OperatorResultInstance
                    # @param [Boolean] redacted Grant access to PII redacted/unredacted Language Understanding operator. If redaction is enabled, the default is True.
                    # @return [OperatorResultInstance] Fetched OperatorResultInstance
                    def fetch(
                        redacted: :unset
                    )

                        context.fetch(
                            redacted: redacted, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Intelligence.V2.OperatorResultInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Intelligence.V2.OperatorResultInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end

