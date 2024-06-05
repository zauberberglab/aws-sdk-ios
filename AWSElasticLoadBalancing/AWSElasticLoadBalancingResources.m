//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSElasticLoadBalancingResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSElasticLoadBalancingResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSElasticLoadBalancingResources

+ (instancetype)sharedInstance {
    static AWSElasticLoadBalancingResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSElasticLoadBalancingResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2015-12-01\",\
    \"endpointPrefix\":\"elasticloadbalancing\",\
    \"protocol\":\"query\",\
    \"protocols\":[\"query\"],\
    \"serviceAbbreviation\":\"Elastic Load Balancing v2\",\
    \"serviceFullName\":\"Elastic Load Balancing\",\
    \"serviceId\":\"Elastic Load Balancing v2\",\
    \"signatureVersion\":\"v4\",\
    \"uid\":\"elasticloadbalancingv2-2015-12-01\",\
    \"xmlNamespace\":\"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/\"\
  },\
  \"operations\":{\
    \"AddListenerCertificates\":{\
      \"name\":\"AddListenerCertificates\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AddListenerCertificatesInput\"},\
      \"output\":{\
        \"shape\":\"AddListenerCertificatesOutput\",\
        \"resultWrapper\":\"AddListenerCertificatesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ListenerNotFoundException\"},\
        {\"shape\":\"TooManyCertificatesException\"},\
        {\"shape\":\"CertificateNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Adds the specified SSL server certificate to the certificate list for the specified HTTPS or TLS listener.</p> <p>If the certificate in already in the certificate list, the call is successful but the certificate is not added again.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html\\\">HTTPS listeners</a> in the <i>Application Load Balancers Guide</i> or <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html\\\">TLS listeners</a> in the <i>Network Load Balancers Guide</i>.</p>\"\
    },\
    \"AddTags\":{\
      \"name\":\"AddTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AddTagsInput\"},\
      \"output\":{\
        \"shape\":\"AddTagsOutput\",\
        \"resultWrapper\":\"AddTagsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"DuplicateTagKeysException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"LoadBalancerNotFoundException\"},\
        {\"shape\":\"TargetGroupNotFoundException\"},\
        {\"shape\":\"ListenerNotFoundException\"},\
        {\"shape\":\"RuleNotFoundException\"},\
        {\"shape\":\"TrustStoreNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Adds the specified tags to the specified Elastic Load Balancing resource. You can tag your Application Load Balancers, Network Load Balancers, Gateway Load Balancers, target groups, trust stores, listeners, and rules.</p> <p>Each tag consists of a key and an optional value. If a resource already has a tag with the same key, <code>AddTags</code> updates its value.</p>\"\
    },\
    \"AddTrustStoreRevocations\":{\
      \"name\":\"AddTrustStoreRevocations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AddTrustStoreRevocationsInput\"},\
      \"output\":{\
        \"shape\":\"AddTrustStoreRevocationsOutput\",\
        \"resultWrapper\":\"AddTrustStoreRevocationsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TrustStoreNotFoundException\"},\
        {\"shape\":\"InvalidRevocationContentException\"},\
        {\"shape\":\"TooManyTrustStoreRevocationEntriesException\"},\
        {\"shape\":\"RevocationContentNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Adds the specified revocation file to the specified trust store.</p>\"\
    },\
    \"CreateListener\":{\
      \"name\":\"CreateListener\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateListenerInput\"},\
      \"output\":{\
        \"shape\":\"CreateListenerOutput\",\
        \"resultWrapper\":\"CreateListenerResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"DuplicateListenerException\"},\
        {\"shape\":\"TooManyListenersException\"},\
        {\"shape\":\"TooManyCertificatesException\"},\
        {\"shape\":\"LoadBalancerNotFoundException\"},\
        {\"shape\":\"TargetGroupNotFoundException\"},\
        {\"shape\":\"TargetGroupAssociationLimitException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"},\
        {\"shape\":\"IncompatibleProtocolsException\"},\
        {\"shape\":\"SSLPolicyNotFoundException\"},\
        {\"shape\":\"CertificateNotFoundException\"},\
        {\"shape\":\"UnsupportedProtocolException\"},\
        {\"shape\":\"TooManyRegistrationsForTargetIdException\"},\
        {\"shape\":\"TooManyTargetsException\"},\
        {\"shape\":\"TooManyActionsException\"},\
        {\"shape\":\"InvalidLoadBalancerActionException\"},\
        {\"shape\":\"TooManyUniqueTargetGroupsPerLoadBalancerException\"},\
        {\"shape\":\"ALPNPolicyNotSupportedException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"TrustStoreNotFoundException\"},\
        {\"shape\":\"TrustStoreNotReadyException\"}\
      ],\
      \"documentation\":\"<p>Creates a listener for the specified Application Load Balancer, Network Load Balancer, or Gateway Load Balancer.</p> <p>For more information, see the following:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html\\\">Listeners for your Application Load Balancers</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-listeners.html\\\">Listeners for your Network Load Balancers</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-listeners.html\\\">Listeners for your Gateway Load Balancers</a> </p> </li> </ul> <p>This operation is idempotent, which means that it completes at most one time. If you attempt to create multiple listeners with the same settings, each call succeeds.</p>\"\
    },\
    \"CreateLoadBalancer\":{\
      \"name\":\"CreateLoadBalancer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLoadBalancerInput\"},\
      \"output\":{\
        \"shape\":\"CreateLoadBalancerOutput\",\
        \"resultWrapper\":\"CreateLoadBalancerResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"DuplicateLoadBalancerNameException\"},\
        {\"shape\":\"TooManyLoadBalancersException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"},\
        {\"shape\":\"SubnetNotFoundException\"},\
        {\"shape\":\"InvalidSubnetException\"},\
        {\"shape\":\"InvalidSecurityGroupException\"},\
        {\"shape\":\"InvalidSchemeException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"DuplicateTagKeysException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"AllocationIdNotFoundException\"},\
        {\"shape\":\"AvailabilityZoneNotSupportedException\"},\
        {\"shape\":\"OperationNotPermittedException\"}\
      ],\
      \"documentation\":\"<p>Creates an Application Load Balancer, Network Load Balancer, or Gateway Load Balancer.</p> <p>For more information, see the following:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html\\\">Application Load Balancers</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html\\\">Network Load Balancers</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-load-balancers.html\\\">Gateway Load Balancers</a> </p> </li> </ul> <p>This operation is idempotent, which means that it completes at most one time. If you attempt to create multiple load balancers with the same settings, each call succeeds.</p>\"\
    },\
    \"CreateRule\":{\
      \"name\":\"CreateRule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateRuleInput\"},\
      \"output\":{\
        \"shape\":\"CreateRuleOutput\",\
        \"resultWrapper\":\"CreateRuleResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"PriorityInUseException\"},\
        {\"shape\":\"TooManyTargetGroupsException\"},\
        {\"shape\":\"TooManyRulesException\"},\
        {\"shape\":\"TargetGroupAssociationLimitException\"},\
        {\"shape\":\"IncompatibleProtocolsException\"},\
        {\"shape\":\"ListenerNotFoundException\"},\
        {\"shape\":\"TargetGroupNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"},\
        {\"shape\":\"TooManyRegistrationsForTargetIdException\"},\
        {\"shape\":\"TooManyTargetsException\"},\
        {\"shape\":\"UnsupportedProtocolException\"},\
        {\"shape\":\"TooManyActionsException\"},\
        {\"shape\":\"InvalidLoadBalancerActionException\"},\
        {\"shape\":\"TooManyUniqueTargetGroupsPerLoadBalancerException\"},\
        {\"shape\":\"TooManyTagsException\"}\
      ],\
      \"documentation\":\"<p>Creates a rule for the specified listener. The listener must be associated with an Application Load Balancer.</p> <p>Each rule consists of a priority, one or more actions, and one or more conditions. Rules are evaluated in priority order, from the lowest value to the highest value. When the conditions for a rule are met, its actions are performed. If the conditions for no rules are met, the actions for the default rule are performed. For more information, see <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#listener-rules\\\">Listener rules</a> in the <i>Application Load Balancers Guide</i>.</p>\"\
    },\
    \"CreateTargetGroup\":{\
      \"name\":\"CreateTargetGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateTargetGroupInput\"},\
      \"output\":{\
        \"shape\":\"CreateTargetGroupOutput\",\
        \"resultWrapper\":\"CreateTargetGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"DuplicateTargetGroupNameException\"},\
        {\"shape\":\"TooManyTargetGroupsException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"},\
        {\"shape\":\"TooManyTagsException\"}\
      ],\
      \"documentation\":\"<p>Creates a target group.</p> <p>For more information, see the following:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html\\\">Target groups for your Application Load Balancers</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html\\\">Target groups for your Network Load Balancers</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-groups.html\\\">Target groups for your Gateway Load Balancers</a> </p> </li> </ul> <p>This operation is idempotent, which means that it completes at most one time. If you attempt to create multiple target groups with the same settings, each call succeeds.</p>\"\
    },\
    \"CreateTrustStore\":{\
      \"name\":\"CreateTrustStore\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateTrustStoreInput\"},\
      \"output\":{\
        \"shape\":\"CreateTrustStoreOutput\",\
        \"resultWrapper\":\"CreateTrustStoreResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"DuplicateTrustStoreNameException\"},\
        {\"shape\":\"TooManyTrustStoresException\"},\
        {\"shape\":\"InvalidCaCertificatesBundleException\"},\
        {\"shape\":\"CaCertificatesBundleNotFoundException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"DuplicateTagKeysException\"}\
      ],\
      \"documentation\":\"<p>Creates a trust store.</p>\"\
    },\
    \"DeleteListener\":{\
      \"name\":\"DeleteListener\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteListenerInput\"},\
      \"output\":{\
        \"shape\":\"DeleteListenerOutput\",\
        \"resultWrapper\":\"DeleteListenerResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ListenerNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified listener.</p> <p>Alternatively, your listener is deleted when you delete the load balancer to which it is attached.</p>\"\
    },\
    \"DeleteLoadBalancer\":{\
      \"name\":\"DeleteLoadBalancer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteLoadBalancerInput\"},\
      \"output\":{\
        \"shape\":\"DeleteLoadBalancerOutput\",\
        \"resultWrapper\":\"DeleteLoadBalancerResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LoadBalancerNotFoundException\"},\
        {\"shape\":\"OperationNotPermittedException\"},\
        {\"shape\":\"ResourceInUseException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified Application Load Balancer, Network Load Balancer, or Gateway Load Balancer. Deleting a load balancer also deletes its listeners.</p> <p>You can't delete a load balancer if deletion protection is enabled. If the load balancer does not exist or has already been deleted, the call succeeds.</p> <p>Deleting a load balancer does not affect its registered targets. For example, your EC2 instances continue to run and are still registered to their target groups. If you no longer need these EC2 instances, you can stop or terminate them.</p>\"\
    },\
    \"DeleteRule\":{\
      \"name\":\"DeleteRule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteRuleInput\"},\
      \"output\":{\
        \"shape\":\"DeleteRuleOutput\",\
        \"resultWrapper\":\"DeleteRuleResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"RuleNotFoundException\"},\
        {\"shape\":\"OperationNotPermittedException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified rule.</p> <p>You can't delete the default rule.</p>\"\
    },\
    \"DeleteTargetGroup\":{\
      \"name\":\"DeleteTargetGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteTargetGroupInput\"},\
      \"output\":{\
        \"shape\":\"DeleteTargetGroupOutput\",\
        \"resultWrapper\":\"DeleteTargetGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceInUseException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified target group.</p> <p>You can delete a target group if it is not referenced by any actions. Deleting a target group also deletes any associated health checks. Deleting a target group does not affect its registered targets. For example, any EC2 instances continue to run until you stop or terminate them.</p>\"\
    },\
    \"DeleteTrustStore\":{\
      \"name\":\"DeleteTrustStore\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteTrustStoreInput\"},\
      \"output\":{\
        \"shape\":\"DeleteTrustStoreOutput\",\
        \"resultWrapper\":\"DeleteTrustStoreResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TrustStoreNotFoundException\"},\
        {\"shape\":\"TrustStoreInUseException\"}\
      ],\
      \"documentation\":\"<p>Deletes a trust store.</p>\"\
    },\
    \"DeregisterTargets\":{\
      \"name\":\"DeregisterTargets\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeregisterTargetsInput\"},\
      \"output\":{\
        \"shape\":\"DeregisterTargetsOutput\",\
        \"resultWrapper\":\"DeregisterTargetsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TargetGroupNotFoundException\"},\
        {\"shape\":\"InvalidTargetException\"}\
      ],\
      \"documentation\":\"<p>Deregisters the specified targets from the specified target group. After the targets are deregistered, they no longer receive traffic from the load balancer.</p> <p>The load balancer stops sending requests to targets that are deregistering, but uses connection draining to ensure that in-flight traffic completes on the existing connections. This deregistration delay is configured by default but can be updated for each target group.</p> <p>For more information, see the following:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html#deregistration-delay\\\"> Deregistration delay</a> in the <i>Application Load Balancers User Guide</i> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html#deregistration-delay\\\"> Deregistration delay</a> in the <i>Network Load Balancers User Guide</i> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-groups.html#deregistration-delay\\\"> Deregistration delay</a> in the <i>Gateway Load Balancers User Guide</i> </p> </li> </ul> <p>Note: If the specified target does not exist, the action returns successfully.</p>\"\
    },\
    \"DescribeAccountLimits\":{\
      \"name\":\"DescribeAccountLimits\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAccountLimitsInput\"},\
      \"output\":{\
        \"shape\":\"DescribeAccountLimitsOutput\",\
        \"resultWrapper\":\"DescribeAccountLimitsResult\"\
      },\
      \"documentation\":\"<p>Describes the current Elastic Load Balancing resource limits for your Amazon Web Services account.</p> <p>For more information, see the following:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html\\\">Quotas for your Application Load Balancers</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-limits.html\\\">Quotas for your Network Load Balancers</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/quotas-limits.html\\\">Quotas for your Gateway Load Balancers</a> </p> </li> </ul>\"\
    },\
    \"DescribeListenerCertificates\":{\
      \"name\":\"DescribeListenerCertificates\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeListenerCertificatesInput\"},\
      \"output\":{\
        \"shape\":\"DescribeListenerCertificatesOutput\",\
        \"resultWrapper\":\"DescribeListenerCertificatesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ListenerNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes the default certificate and the certificate list for the specified HTTPS or TLS listener.</p> <p>If the default certificate is also in the certificate list, it appears twice in the results (once with <code>IsDefault</code> set to true and once with <code>IsDefault</code> set to false).</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#https-listener-certificates\\\">SSL certificates</a> in the <i>Application Load Balancers Guide</i> or <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#tls-listener-certificate\\\">Server certificates</a> in the <i>Network Load Balancers Guide</i>.</p>\"\
    },\
    \"DescribeListeners\":{\
      \"name\":\"DescribeListeners\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeListenersInput\"},\
      \"output\":{\
        \"shape\":\"DescribeListenersOutput\",\
        \"resultWrapper\":\"DescribeListenersResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ListenerNotFoundException\"},\
        {\"shape\":\"LoadBalancerNotFoundException\"},\
        {\"shape\":\"UnsupportedProtocolException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified listeners or the listeners for the specified Application Load Balancer, Network Load Balancer, or Gateway Load Balancer. You must specify either a load balancer or one or more listeners.</p>\"\
    },\
    \"DescribeLoadBalancerAttributes\":{\
      \"name\":\"DescribeLoadBalancerAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLoadBalancerAttributesInput\"},\
      \"output\":{\
        \"shape\":\"DescribeLoadBalancerAttributesOutput\",\
        \"resultWrapper\":\"DescribeLoadBalancerAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LoadBalancerNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes the attributes for the specified Application Load Balancer, Network Load Balancer, or Gateway Load Balancer.</p> <p>For more information, see the following:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html#load-balancer-attributes\\\">Load balancer attributes</a> in the <i>Application Load Balancers Guide</i> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html#load-balancer-attributes\\\">Load balancer attributes</a> in the <i>Network Load Balancers Guide</i> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-load-balancers.html#load-balancer-attributes\\\">Load balancer attributes</a> in the <i>Gateway Load Balancers Guide</i> </p> </li> </ul>\"\
    },\
    \"DescribeLoadBalancers\":{\
      \"name\":\"DescribeLoadBalancers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLoadBalancersInput\"},\
      \"output\":{\
        \"shape\":\"DescribeLoadBalancersOutput\",\
        \"resultWrapper\":\"DescribeLoadBalancersResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LoadBalancerNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified load balancers or all of your load balancers.</p>\"\
    },\
    \"DescribeRules\":{\
      \"name\":\"DescribeRules\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeRulesInput\"},\
      \"output\":{\
        \"shape\":\"DescribeRulesOutput\",\
        \"resultWrapper\":\"DescribeRulesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ListenerNotFoundException\"},\
        {\"shape\":\"RuleNotFoundException\"},\
        {\"shape\":\"UnsupportedProtocolException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified rules or the rules for the specified listener. You must specify either a listener or one or more rules.</p>\"\
    },\
    \"DescribeSSLPolicies\":{\
      \"name\":\"DescribeSSLPolicies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSSLPoliciesInput\"},\
      \"output\":{\
        \"shape\":\"DescribeSSLPoliciesOutput\",\
        \"resultWrapper\":\"DescribeSSLPoliciesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"SSLPolicyNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified policies or all policies used for SSL negotiation.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies\\\">Security policies</a> in the <i>Application Load Balancers Guide</i> or <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#describe-ssl-policies\\\">Security policies</a> in the <i>Network Load Balancers Guide</i>.</p>\"\
    },\
    \"DescribeTags\":{\
      \"name\":\"DescribeTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTagsInput\"},\
      \"output\":{\
        \"shape\":\"DescribeTagsOutput\",\
        \"resultWrapper\":\"DescribeTagsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LoadBalancerNotFoundException\"},\
        {\"shape\":\"TargetGroupNotFoundException\"},\
        {\"shape\":\"ListenerNotFoundException\"},\
        {\"shape\":\"RuleNotFoundException\"},\
        {\"shape\":\"TrustStoreNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes the tags for the specified Elastic Load Balancing resources. You can describe the tags for one or more Application Load Balancers, Network Load Balancers, Gateway Load Balancers, target groups, listeners, or rules.</p>\"\
    },\
    \"DescribeTargetGroupAttributes\":{\
      \"name\":\"DescribeTargetGroupAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTargetGroupAttributesInput\"},\
      \"output\":{\
        \"shape\":\"DescribeTargetGroupAttributesOutput\",\
        \"resultWrapper\":\"DescribeTargetGroupAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TargetGroupNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes the attributes for the specified target group.</p> <p>For more information, see the following:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html#target-group-attributes\\\">Target group attributes</a> in the <i>Application Load Balancers Guide</i> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html#target-group-attributes\\\">Target group attributes</a> in the <i>Network Load Balancers Guide</i> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-groups.html#target-group-attributes\\\">Target group attributes</a> in the <i>Gateway Load Balancers Guide</i> </p> </li> </ul>\"\
    },\
    \"DescribeTargetGroups\":{\
      \"name\":\"DescribeTargetGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTargetGroupsInput\"},\
      \"output\":{\
        \"shape\":\"DescribeTargetGroupsOutput\",\
        \"resultWrapper\":\"DescribeTargetGroupsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LoadBalancerNotFoundException\"},\
        {\"shape\":\"TargetGroupNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified target groups or all of your target groups. By default, all target groups are described. Alternatively, you can specify one of the following to filter the results: the ARN of the load balancer, the names of one or more target groups, or the ARNs of one or more target groups.</p>\"\
    },\
    \"DescribeTargetHealth\":{\
      \"name\":\"DescribeTargetHealth\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTargetHealthInput\"},\
      \"output\":{\
        \"shape\":\"DescribeTargetHealthOutput\",\
        \"resultWrapper\":\"DescribeTargetHealthResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidTargetException\"},\
        {\"shape\":\"TargetGroupNotFoundException\"},\
        {\"shape\":\"HealthUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Describes the health of the specified targets or all of your targets.</p>\"\
    },\
    \"DescribeTrustStoreAssociations\":{\
      \"name\":\"DescribeTrustStoreAssociations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTrustStoreAssociationsInput\"},\
      \"output\":{\
        \"shape\":\"DescribeTrustStoreAssociationsOutput\",\
        \"resultWrapper\":\"DescribeTrustStoreAssociationsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TrustStoreNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes all resources associated with the specified trust store.</p>\"\
    },\
    \"DescribeTrustStoreRevocations\":{\
      \"name\":\"DescribeTrustStoreRevocations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTrustStoreRevocationsInput\"},\
      \"output\":{\
        \"shape\":\"DescribeTrustStoreRevocationsOutput\",\
        \"resultWrapper\":\"DescribeTrustStoreRevocationsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TrustStoreNotFoundException\"},\
        {\"shape\":\"RevocationIdNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes the revocation files in use by the specified trust store arn, or revocation ID.</p>\"\
    },\
    \"DescribeTrustStores\":{\
      \"name\":\"DescribeTrustStores\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTrustStoresInput\"},\
      \"output\":{\
        \"shape\":\"DescribeTrustStoresOutput\",\
        \"resultWrapper\":\"DescribeTrustStoresResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TrustStoreNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes all trust stores for a given account by trust store arnâs or name.</p>\"\
    },\
    \"GetTrustStoreCaCertificatesBundle\":{\
      \"name\":\"GetTrustStoreCaCertificatesBundle\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetTrustStoreCaCertificatesBundleInput\"},\
      \"output\":{\
        \"shape\":\"GetTrustStoreCaCertificatesBundleOutput\",\
        \"resultWrapper\":\"GetTrustStoreCaCertificatesBundleResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TrustStoreNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the ca certificate bundle.</p> <p>This action returns a pre-signed S3 URI which is active for ten minutes.</p>\"\
    },\
    \"GetTrustStoreRevocationContent\":{\
      \"name\":\"GetTrustStoreRevocationContent\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetTrustStoreRevocationContentInput\"},\
      \"output\":{\
        \"shape\":\"GetTrustStoreRevocationContentOutput\",\
        \"resultWrapper\":\"GetTrustStoreRevocationContentResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TrustStoreNotFoundException\"},\
        {\"shape\":\"RevocationIdNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the specified revocation file.</p> <p>This action returns a pre-signed S3 URI which is active for ten minutes.</p>\"\
    },\
    \"ModifyListener\":{\
      \"name\":\"ModifyListener\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyListenerInput\"},\
      \"output\":{\
        \"shape\":\"ModifyListenerOutput\",\
        \"resultWrapper\":\"ModifyListenerResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"DuplicateListenerException\"},\
        {\"shape\":\"TooManyListenersException\"},\
        {\"shape\":\"TooManyCertificatesException\"},\
        {\"shape\":\"ListenerNotFoundException\"},\
        {\"shape\":\"TargetGroupNotFoundException\"},\
        {\"shape\":\"TargetGroupAssociationLimitException\"},\
        {\"shape\":\"IncompatibleProtocolsException\"},\
        {\"shape\":\"SSLPolicyNotFoundException\"},\
        {\"shape\":\"CertificateNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"},\
        {\"shape\":\"UnsupportedProtocolException\"},\
        {\"shape\":\"TooManyRegistrationsForTargetIdException\"},\
        {\"shape\":\"TooManyTargetsException\"},\
        {\"shape\":\"TooManyActionsException\"},\
        {\"shape\":\"InvalidLoadBalancerActionException\"},\
        {\"shape\":\"TooManyUniqueTargetGroupsPerLoadBalancerException\"},\
        {\"shape\":\"ALPNPolicyNotSupportedException\"},\
        {\"shape\":\"TrustStoreNotFoundException\"},\
        {\"shape\":\"TrustStoreNotReadyException\"}\
      ],\
      \"documentation\":\"<p>Replaces the specified properties of the specified listener. Any properties that you do not specify remain unchanged.</p> <p>Changing the protocol from HTTPS to HTTP, or from TLS to TCP, removes the security policy and default certificate properties. If you change the protocol from HTTP to HTTPS, or from TCP to TLS, you must add the security policy and default certificate properties.</p> <p>To add an item to a list, remove an item from a list, or update an item in a list, you must provide the entire list. For example, to add an action, specify a list with the current actions plus the new action.</p>\"\
    },\
    \"ModifyLoadBalancerAttributes\":{\
      \"name\":\"ModifyLoadBalancerAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyLoadBalancerAttributesInput\"},\
      \"output\":{\
        \"shape\":\"ModifyLoadBalancerAttributesOutput\",\
        \"resultWrapper\":\"ModifyLoadBalancerAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LoadBalancerNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"}\
      ],\
      \"documentation\":\"<p>Modifies the specified attributes of the specified Application Load Balancer, Network Load Balancer, or Gateway Load Balancer.</p> <p>If any of the specified attributes can't be modified as requested, the call fails. Any existing attributes that you do not modify retain their current values.</p>\"\
    },\
    \"ModifyRule\":{\
      \"name\":\"ModifyRule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyRuleInput\"},\
      \"output\":{\
        \"shape\":\"ModifyRuleOutput\",\
        \"resultWrapper\":\"ModifyRuleResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TargetGroupAssociationLimitException\"},\
        {\"shape\":\"IncompatibleProtocolsException\"},\
        {\"shape\":\"RuleNotFoundException\"},\
        {\"shape\":\"OperationNotPermittedException\"},\
        {\"shape\":\"TooManyRegistrationsForTargetIdException\"},\
        {\"shape\":\"TooManyTargetsException\"},\
        {\"shape\":\"TargetGroupNotFoundException\"},\
        {\"shape\":\"UnsupportedProtocolException\"},\
        {\"shape\":\"TooManyActionsException\"},\
        {\"shape\":\"InvalidLoadBalancerActionException\"},\
        {\"shape\":\"TooManyUniqueTargetGroupsPerLoadBalancerException\"}\
      ],\
      \"documentation\":\"<p>Replaces the specified properties of the specified rule. Any properties that you do not specify are unchanged.</p> <p>To add an item to a list, remove an item from a list, or update an item in a list, you must provide the entire list. For example, to add an action, specify a list with the current actions plus the new action.</p>\"\
    },\
    \"ModifyTargetGroup\":{\
      \"name\":\"ModifyTargetGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyTargetGroupInput\"},\
      \"output\":{\
        \"shape\":\"ModifyTargetGroupOutput\",\
        \"resultWrapper\":\"ModifyTargetGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TargetGroupNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"}\
      ],\
      \"documentation\":\"<p>Modifies the health checks used when evaluating the health state of the targets in the specified target group.</p>\"\
    },\
    \"ModifyTargetGroupAttributes\":{\
      \"name\":\"ModifyTargetGroupAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyTargetGroupAttributesInput\"},\
      \"output\":{\
        \"shape\":\"ModifyTargetGroupAttributesOutput\",\
        \"resultWrapper\":\"ModifyTargetGroupAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TargetGroupNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"}\
      ],\
      \"documentation\":\"<p>Modifies the specified attributes of the specified target group.</p>\"\
    },\
    \"ModifyTrustStore\":{\
      \"name\":\"ModifyTrustStore\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyTrustStoreInput\"},\
      \"output\":{\
        \"shape\":\"ModifyTrustStoreOutput\",\
        \"resultWrapper\":\"ModifyTrustStoreResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TrustStoreNotFoundException\"},\
        {\"shape\":\"InvalidCaCertificatesBundleException\"},\
        {\"shape\":\"CaCertificatesBundleNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Update the ca certificate bundle for a given trust store.</p>\"\
    },\
    \"RegisterTargets\":{\
      \"name\":\"RegisterTargets\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RegisterTargetsInput\"},\
      \"output\":{\
        \"shape\":\"RegisterTargetsOutput\",\
        \"resultWrapper\":\"RegisterTargetsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TargetGroupNotFoundException\"},\
        {\"shape\":\"TooManyTargetsException\"},\
        {\"shape\":\"InvalidTargetException\"},\
        {\"shape\":\"TooManyRegistrationsForTargetIdException\"}\
      ],\
      \"documentation\":\"<p>Registers the specified targets with the specified target group.</p> <p>If the target is an EC2 instance, it must be in the <code>running</code> state when you register it.</p> <p>By default, the load balancer routes requests to registered targets using the protocol and port for the target group. Alternatively, you can override the port for a target when you register it. You can register each EC2 instance or IP address with the same target group multiple times using different ports.</p> <p>With a Network Load Balancer, you cannot register instances by instance ID if they have the following instance types: C1, CC1, CC2, CG1, CG2, CR1, CS1, G1, G2, HI1, HS1, M1, M2, M3, and T1. You can register instances of these types by IP address.</p>\"\
    },\
    \"RemoveListenerCertificates\":{\
      \"name\":\"RemoveListenerCertificates\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RemoveListenerCertificatesInput\"},\
      \"output\":{\
        \"shape\":\"RemoveListenerCertificatesOutput\",\
        \"resultWrapper\":\"RemoveListenerCertificatesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ListenerNotFoundException\"},\
        {\"shape\":\"OperationNotPermittedException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified certificate from the certificate list for the specified HTTPS or TLS listener.</p>\"\
    },\
    \"RemoveTags\":{\
      \"name\":\"RemoveTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RemoveTagsInput\"},\
      \"output\":{\
        \"shape\":\"RemoveTagsOutput\",\
        \"resultWrapper\":\"RemoveTagsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LoadBalancerNotFoundException\"},\
        {\"shape\":\"TargetGroupNotFoundException\"},\
        {\"shape\":\"ListenerNotFoundException\"},\
        {\"shape\":\"RuleNotFoundException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"TrustStoreNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified tags from the specified Elastic Load Balancing resources. You can remove the tags for one or more Application Load Balancers, Network Load Balancers, Gateway Load Balancers, target groups, listeners, or rules.</p>\"\
    },\
    \"RemoveTrustStoreRevocations\":{\
      \"name\":\"RemoveTrustStoreRevocations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RemoveTrustStoreRevocationsInput\"},\
      \"output\":{\
        \"shape\":\"RemoveTrustStoreRevocationsOutput\",\
        \"resultWrapper\":\"RemoveTrustStoreRevocationsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TrustStoreNotFoundException\"},\
        {\"shape\":\"RevocationIdNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified revocation file from the specified trust store.</p>\"\
    },\
    \"SetIpAddressType\":{\
      \"name\":\"SetIpAddressType\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetIpAddressTypeInput\"},\
      \"output\":{\
        \"shape\":\"SetIpAddressTypeOutput\",\
        \"resultWrapper\":\"SetIpAddressTypeResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LoadBalancerNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"},\
        {\"shape\":\"InvalidSubnetException\"}\
      ],\
      \"documentation\":\"<p>Sets the type of IP addresses used by the subnets of the specified load balancer.</p>\"\
    },\
    \"SetRulePriorities\":{\
      \"name\":\"SetRulePriorities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetRulePrioritiesInput\"},\
      \"output\":{\
        \"shape\":\"SetRulePrioritiesOutput\",\
        \"resultWrapper\":\"SetRulePrioritiesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"RuleNotFoundException\"},\
        {\"shape\":\"PriorityInUseException\"},\
        {\"shape\":\"OperationNotPermittedException\"}\
      ],\
      \"documentation\":\"<p>Sets the priorities of the specified rules.</p> <p>You can reorder the rules as long as there are no priority conflicts in the new order. Any existing rules that you do not specify retain their current priority.</p>\"\
    },\
    \"SetSecurityGroups\":{\
      \"name\":\"SetSecurityGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetSecurityGroupsInput\"},\
      \"output\":{\
        \"shape\":\"SetSecurityGroupsOutput\",\
        \"resultWrapper\":\"SetSecurityGroupsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LoadBalancerNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"},\
        {\"shape\":\"InvalidSecurityGroupException\"}\
      ],\
      \"documentation\":\"<p>Associates the specified security groups with the specified Application Load Balancer or Network Load Balancer. The specified security groups override the previously associated security groups.</p> <p>You can't perform this operation on a Network Load Balancer unless you specified a security group for the load balancer when you created it.</p> <p>You can't associate a security group with a Gateway Load Balancer.</p>\"\
    },\
    \"SetSubnets\":{\
      \"name\":\"SetSubnets\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetSubnetsInput\"},\
      \"output\":{\
        \"shape\":\"SetSubnetsOutput\",\
        \"resultWrapper\":\"SetSubnetsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LoadBalancerNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"},\
        {\"shape\":\"SubnetNotFoundException\"},\
        {\"shape\":\"InvalidSubnetException\"},\
        {\"shape\":\"AllocationIdNotFoundException\"},\
        {\"shape\":\"AvailabilityZoneNotSupportedException\"}\
      ],\
      \"documentation\":\"<p>Enables the Availability Zones for the specified public subnets for the specified Application Load Balancer, Network Load Balancer or Gateway Load Balancer. The specified subnets replace the previously enabled subnets.</p> <p>When you specify subnets for a Network Load Balancer, or Gateway Load Balancer you must include all subnets that were enabled previously, with their existing configurations, plus any additional subnets.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"ALPNPolicyNotSupportedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified ALPN policy is not supported.</p>\",\
      \"error\":{\
        \"code\":\"ALPNPolicyNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Action\":{\
      \"type\":\"structure\",\
      \"required\":[\"Type\"],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"ActionTypeEnum\",\
          \"documentation\":\"<p>The type of action.</p>\"\
        },\
        \"TargetGroupArn\":{\
          \"shape\":\"TargetGroupArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the target group. Specify only when <code>Type</code> is <code>forward</code> and you want to route to a single target group. To route to one or more target groups, use <code>ForwardConfig</code> instead.</p>\"\
        },\
        \"AuthenticateOidcConfig\":{\
          \"shape\":\"AuthenticateOidcActionConfig\",\
          \"documentation\":\"<p>[HTTPS listeners] Information about an identity provider that is compliant with OpenID Connect (OIDC). Specify only when <code>Type</code> is <code>authenticate-oidc</code>.</p>\"\
        },\
        \"AuthenticateCognitoConfig\":{\
          \"shape\":\"AuthenticateCognitoActionConfig\",\
          \"documentation\":\"<p>[HTTPS listeners] Information for using Amazon Cognito to authenticate users. Specify only when <code>Type</code> is <code>authenticate-cognito</code>.</p>\"\
        },\
        \"Order\":{\
          \"shape\":\"ActionOrder\",\
          \"documentation\":\"<p>The order for the action. This value is required for rules with multiple actions. The action with the lowest value for order is performed first.</p>\"\
        },\
        \"RedirectConfig\":{\
          \"shape\":\"RedirectActionConfig\",\
          \"documentation\":\"<p>[Application Load Balancer] Information for creating a redirect action. Specify only when <code>Type</code> is <code>redirect</code>.</p>\"\
        },\
        \"FixedResponseConfig\":{\
          \"shape\":\"FixedResponseActionConfig\",\
          \"documentation\":\"<p>[Application Load Balancer] Information for creating an action that returns a custom HTTP response. Specify only when <code>Type</code> is <code>fixed-response</code>.</p>\"\
        },\
        \"ForwardConfig\":{\
          \"shape\":\"ForwardActionConfig\",\
          \"documentation\":\"<p>Information for creating an action that distributes requests among one or more target groups. For Network Load Balancers, you can specify a single target group. Specify only when <code>Type</code> is <code>forward</code>. If you specify both <code>ForwardConfig</code> and <code>TargetGroupArn</code>, you can specify only one target group using <code>ForwardConfig</code> and it must be the same target group specified in <code>TargetGroupArn</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an action.</p> <p>Each rule must include exactly one of the following types of actions: <code>forward</code>, <code>fixed-response</code>, or <code>redirect</code>, and it must be the last action to be performed.</p>\"\
    },\
    \"ActionOrder\":{\
      \"type\":\"integer\",\
      \"max\":50000,\
      \"min\":1\
    },\
    \"ActionTypeEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"forward\",\
        \"authenticate-oidc\",\
        \"authenticate-cognito\",\
        \"redirect\",\
        \"fixed-response\"\
      ]\
    },\
    \"Actions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Action\"}\
    },\
    \"AddListenerCertificatesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ListenerArn\",\
        \"Certificates\"\
      ],\
      \"members\":{\
        \"ListenerArn\":{\
          \"shape\":\"ListenerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the listener.</p>\"\
        },\
        \"Certificates\":{\
          \"shape\":\"CertificateList\",\
          \"documentation\":\"<p>The certificate to add. You can specify one certificate per call. Set <code>CertificateArn</code> to the certificate ARN but do not set <code>IsDefault</code>.</p>\"\
        }\
      }\
    },\
    \"AddListenerCertificatesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Certificates\":{\
          \"shape\":\"CertificateList\",\
          \"documentation\":\"<p>Information about the certificates in the certificate list.</p>\"\
        }\
      }\
    },\
    \"AddTagsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArns\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceArns\":{\
          \"shape\":\"ResourceArns\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags.</p>\"\
        }\
      }\
    },\
    \"AddTagsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"AddTrustStoreRevocationsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrustStoreArn\"],\
      \"members\":{\
        \"TrustStoreArn\":{\
          \"shape\":\"TrustStoreArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trust store.</p>\"\
        },\
        \"RevocationContents\":{\
          \"shape\":\"RevocationContents\",\
          \"documentation\":\"<p>The revocation file to add.</p>\"\
        }\
      }\
    },\
    \"AddTrustStoreRevocationsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrustStoreRevocations\":{\
          \"shape\":\"TrustStoreRevocations\",\
          \"documentation\":\"<p>Information about the revocation file added to the trust store.</p>\"\
        }\
      }\
    },\
    \"AllocationId\":{\"type\":\"string\"},\
    \"AllocationIdNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified allocation ID does not exist.</p>\",\
      \"error\":{\
        \"code\":\"AllocationIdNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"AlpnPolicyName\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AlpnPolicyValue\"}\
    },\
    \"AlpnPolicyValue\":{\"type\":\"string\"},\
    \"AnomalyDetection\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Result\":{\
          \"shape\":\"AnomalyResultEnum\",\
          \"documentation\":\"<p>The latest anomaly detection result.</p>\"\
        },\
        \"MitigationInEffect\":{\
          \"shape\":\"MitigationInEffectEnum\",\
          \"documentation\":\"<p>Indicates whether anomaly mitigation is in progress.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about anomaly detection and mitigation.</p>\"\
    },\
    \"AnomalyResultEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"anomalous\",\
        \"normal\"\
      ]\
    },\
    \"AuthenticateCognitoActionAuthenticationRequestExtraParams\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AuthenticateCognitoActionAuthenticationRequestParamName\"},\
      \"value\":{\"shape\":\"AuthenticateCognitoActionAuthenticationRequestParamValue\"}\
    },\
    \"AuthenticateCognitoActionAuthenticationRequestParamName\":{\"type\":\"string\"},\
    \"AuthenticateCognitoActionAuthenticationRequestParamValue\":{\"type\":\"string\"},\
    \"AuthenticateCognitoActionConditionalBehaviorEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"deny\",\
        \"allow\",\
        \"authenticate\"\
      ]\
    },\
    \"AuthenticateCognitoActionConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolArn\",\
        \"UserPoolClientId\",\
        \"UserPoolDomain\"\
      ],\
      \"members\":{\
        \"UserPoolArn\":{\
          \"shape\":\"AuthenticateCognitoActionUserPoolArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Cognito user pool.</p>\"\
        },\
        \"UserPoolClientId\":{\
          \"shape\":\"AuthenticateCognitoActionUserPoolClientId\",\
          \"documentation\":\"<p>The ID of the Amazon Cognito user pool client.</p>\"\
        },\
        \"UserPoolDomain\":{\
          \"shape\":\"AuthenticateCognitoActionUserPoolDomain\",\
          \"documentation\":\"<p>The domain prefix or fully-qualified domain name of the Amazon Cognito user pool.</p>\"\
        },\
        \"SessionCookieName\":{\
          \"shape\":\"AuthenticateCognitoActionSessionCookieName\",\
          \"documentation\":\"<p>The name of the cookie used to maintain session information. The default is AWSELBAuthSessionCookie.</p>\"\
        },\
        \"Scope\":{\
          \"shape\":\"AuthenticateCognitoActionScope\",\
          \"documentation\":\"<p>The set of user claims to be requested from the IdP. The default is <code>openid</code>.</p> <p>To verify which scope values your IdP supports and how to separate multiple values, see the documentation for your IdP.</p>\"\
        },\
        \"SessionTimeout\":{\
          \"shape\":\"AuthenticateCognitoActionSessionTimeout\",\
          \"documentation\":\"<p>The maximum duration of the authentication session, in seconds. The default is 604800 seconds (7 days).</p>\"\
        },\
        \"AuthenticationRequestExtraParams\":{\
          \"shape\":\"AuthenticateCognitoActionAuthenticationRequestExtraParams\",\
          \"documentation\":\"<p>The query parameters (up to 10) to include in the redirect request to the authorization endpoint.</p>\"\
        },\
        \"OnUnauthenticatedRequest\":{\
          \"shape\":\"AuthenticateCognitoActionConditionalBehaviorEnum\",\
          \"documentation\":\"<p>The behavior if the user is not authenticated. The following are possible values:</p> <ul> <li> <p>deny<code/> - Return an HTTP 401 Unauthorized error.</p> </li> <li> <p>allow<code/> - Allow the request to be forwarded to the target.</p> </li> <li> <p>authenticate<code/> - Redirect the request to the IdP authorization endpoint. This is the default value.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Request parameters to use when integrating with Amazon Cognito to authenticate users.</p>\"\
    },\
    \"AuthenticateCognitoActionScope\":{\"type\":\"string\"},\
    \"AuthenticateCognitoActionSessionCookieName\":{\"type\":\"string\"},\
    \"AuthenticateCognitoActionSessionTimeout\":{\"type\":\"long\"},\
    \"AuthenticateCognitoActionUserPoolArn\":{\"type\":\"string\"},\
    \"AuthenticateCognitoActionUserPoolClientId\":{\"type\":\"string\"},\
    \"AuthenticateCognitoActionUserPoolDomain\":{\"type\":\"string\"},\
    \"AuthenticateOidcActionAuthenticationRequestExtraParams\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AuthenticateOidcActionAuthenticationRequestParamName\"},\
      \"value\":{\"shape\":\"AuthenticateOidcActionAuthenticationRequestParamValue\"}\
    },\
    \"AuthenticateOidcActionAuthenticationRequestParamName\":{\"type\":\"string\"},\
    \"AuthenticateOidcActionAuthenticationRequestParamValue\":{\"type\":\"string\"},\
    \"AuthenticateOidcActionAuthorizationEndpoint\":{\"type\":\"string\"},\
    \"AuthenticateOidcActionClientId\":{\"type\":\"string\"},\
    \"AuthenticateOidcActionClientSecret\":{\"type\":\"string\"},\
    \"AuthenticateOidcActionConditionalBehaviorEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"deny\",\
        \"allow\",\
        \"authenticate\"\
      ]\
    },\
    \"AuthenticateOidcActionConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Issuer\",\
        \"AuthorizationEndpoint\",\
        \"TokenEndpoint\",\
        \"UserInfoEndpoint\",\
        \"ClientId\"\
      ],\
      \"members\":{\
        \"Issuer\":{\
          \"shape\":\"AuthenticateOidcActionIssuer\",\
          \"documentation\":\"<p>The OIDC issuer identifier of the IdP. This must be a full URL, including the HTTPS protocol, the domain, and the path.</p>\"\
        },\
        \"AuthorizationEndpoint\":{\
          \"shape\":\"AuthenticateOidcActionAuthorizationEndpoint\",\
          \"documentation\":\"<p>The authorization endpoint of the IdP. This must be a full URL, including the HTTPS protocol, the domain, and the path.</p>\"\
        },\
        \"TokenEndpoint\":{\
          \"shape\":\"AuthenticateOidcActionTokenEndpoint\",\
          \"documentation\":\"<p>The token endpoint of the IdP. This must be a full URL, including the HTTPS protocol, the domain, and the path.</p>\"\
        },\
        \"UserInfoEndpoint\":{\
          \"shape\":\"AuthenticateOidcActionUserInfoEndpoint\",\
          \"documentation\":\"<p>The user info endpoint of the IdP. This must be a full URL, including the HTTPS protocol, the domain, and the path.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"AuthenticateOidcActionClientId\",\
          \"documentation\":\"<p>The OAuth 2.0 client identifier.</p>\"\
        },\
        \"ClientSecret\":{\
          \"shape\":\"AuthenticateOidcActionClientSecret\",\
          \"documentation\":\"<p>The OAuth 2.0 client secret. This parameter is required if you are creating a rule. If you are modifying a rule, you can omit this parameter if you set <code>UseExistingClientSecret</code> to true.</p>\"\
        },\
        \"SessionCookieName\":{\
          \"shape\":\"AuthenticateOidcActionSessionCookieName\",\
          \"documentation\":\"<p>The name of the cookie used to maintain session information. The default is AWSELBAuthSessionCookie.</p>\"\
        },\
        \"Scope\":{\
          \"shape\":\"AuthenticateOidcActionScope\",\
          \"documentation\":\"<p>The set of user claims to be requested from the IdP. The default is <code>openid</code>.</p> <p>To verify which scope values your IdP supports and how to separate multiple values, see the documentation for your IdP.</p>\"\
        },\
        \"SessionTimeout\":{\
          \"shape\":\"AuthenticateOidcActionSessionTimeout\",\
          \"documentation\":\"<p>The maximum duration of the authentication session, in seconds. The default is 604800 seconds (7 days).</p>\"\
        },\
        \"AuthenticationRequestExtraParams\":{\
          \"shape\":\"AuthenticateOidcActionAuthenticationRequestExtraParams\",\
          \"documentation\":\"<p>The query parameters (up to 10) to include in the redirect request to the authorization endpoint.</p>\"\
        },\
        \"OnUnauthenticatedRequest\":{\
          \"shape\":\"AuthenticateOidcActionConditionalBehaviorEnum\",\
          \"documentation\":\"<p>The behavior if the user is not authenticated. The following are possible values:</p> <ul> <li> <p>deny<code/> - Return an HTTP 401 Unauthorized error.</p> </li> <li> <p>allow<code/> - Allow the request to be forwarded to the target.</p> </li> <li> <p>authenticate<code/> - Redirect the request to the IdP authorization endpoint. This is the default value.</p> </li> </ul>\"\
        },\
        \"UseExistingClientSecret\":{\
          \"shape\":\"AuthenticateOidcActionUseExistingClientSecret\",\
          \"documentation\":\"<p>Indicates whether to use the existing client secret when modifying a rule. If you are creating a rule, you can omit this parameter or set it to false.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Request parameters when using an identity provider (IdP) that is compliant with OpenID Connect (OIDC) to authenticate users.</p>\"\
    },\
    \"AuthenticateOidcActionIssuer\":{\"type\":\"string\"},\
    \"AuthenticateOidcActionScope\":{\"type\":\"string\"},\
    \"AuthenticateOidcActionSessionCookieName\":{\"type\":\"string\"},\
    \"AuthenticateOidcActionSessionTimeout\":{\"type\":\"long\"},\
    \"AuthenticateOidcActionTokenEndpoint\":{\"type\":\"string\"},\
    \"AuthenticateOidcActionUseExistingClientSecret\":{\"type\":\"boolean\"},\
    \"AuthenticateOidcActionUserInfoEndpoint\":{\"type\":\"string\"},\
    \"AvailabilityZone\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ZoneName\":{\
          \"shape\":\"ZoneName\",\
          \"documentation\":\"<p>The name of the Availability Zone.</p>\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"SubnetId\",\
          \"documentation\":\"<p>The ID of the subnet. You can specify one subnet per Availability Zone.</p>\"\
        },\
        \"OutpostId\":{\
          \"shape\":\"OutpostId\",\
          \"documentation\":\"<p>[Application Load Balancers on Outposts] The ID of the Outpost.</p>\"\
        },\
        \"LoadBalancerAddresses\":{\
          \"shape\":\"LoadBalancerAddresses\",\
          \"documentation\":\"<p>[Network Load Balancers] If you need static IP addresses for your load balancer, you can specify one Elastic IP address per Availability Zone when you create an internal-facing load balancer. For internal load balancers, you can specify a private IP address from the IPv4 range of the subnet.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an Availability Zone.</p>\"\
    },\
    \"AvailabilityZoneNotSupportedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified Availability Zone is not supported.</p>\",\
      \"error\":{\
        \"code\":\"AvailabilityZoneNotSupported\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"AvailabilityZones\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AvailabilityZone\"}\
    },\
    \"CaCertificatesBundleNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified ca certificate bundle does not exist.</p>\",\
      \"error\":{\
        \"code\":\"CaCertificatesBundleNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CanonicalHostedZoneId\":{\"type\":\"string\"},\
    \"Certificate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CertificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the certificate.</p>\"\
        },\
        \"IsDefault\":{\
          \"shape\":\"Default\",\
          \"documentation\":\"<p>Indicates whether the certificate is the default certificate. Do not set this value when specifying a certificate as an input. This value is not included in the output when describing a listener, but is included when describing listener certificates.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an SSL server certificate.</p>\"\
    },\
    \"CertificateArn\":{\"type\":\"string\"},\
    \"CertificateList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Certificate\"}\
    },\
    \"CertificateNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified certificate does not exist.</p>\",\
      \"error\":{\
        \"code\":\"CertificateNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Cipher\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"CipherName\",\
          \"documentation\":\"<p>The name of the cipher.</p>\"\
        },\
        \"Priority\":{\
          \"shape\":\"CipherPriority\",\
          \"documentation\":\"<p>The priority of the cipher.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a cipher used in a policy.</p>\"\
    },\
    \"CipherName\":{\"type\":\"string\"},\
    \"CipherPriority\":{\"type\":\"integer\"},\
    \"Ciphers\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Cipher\"}\
    },\
    \"ConditionFieldName\":{\
      \"type\":\"string\",\
      \"max\":64\
    },\
    \"CreateListenerInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerArn\",\
        \"DefaultActions\"\
      ],\
      \"members\":{\
        \"LoadBalancerArn\":{\
          \"shape\":\"LoadBalancerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the load balancer.</p>\"\
        },\
        \"Protocol\":{\
          \"shape\":\"ProtocolEnum\",\
          \"documentation\":\"<p>The protocol for connections from clients to the load balancer. For Application Load Balancers, the supported protocols are HTTP and HTTPS. For Network Load Balancers, the supported protocols are TCP, TLS, UDP, and TCP_UDP. You canât specify the UDP or TCP_UDP protocol if dual-stack mode is enabled. You cannot specify a protocol for a Gateway Load Balancer.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The port on which the load balancer is listening. You cannot specify a port for a Gateway Load Balancer.</p>\"\
        },\
        \"SslPolicy\":{\
          \"shape\":\"SslPolicyName\",\
          \"documentation\":\"<p>[HTTPS and TLS listeners] The security policy that defines which protocols and ciphers are supported.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies\\\">Security policies</a> in the <i>Application Load Balancers Guide</i> and <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#describe-ssl-policies\\\">Security policies</a> in the <i>Network Load Balancers Guide</i>.</p>\"\
        },\
        \"Certificates\":{\
          \"shape\":\"CertificateList\",\
          \"documentation\":\"<p>[HTTPS and TLS listeners] The default certificate for the listener. You must provide exactly one certificate. Set <code>CertificateArn</code> to the certificate ARN but do not set <code>IsDefault</code>.</p>\"\
        },\
        \"DefaultActions\":{\
          \"shape\":\"Actions\",\
          \"documentation\":\"<p>The actions for the default rule.</p>\"\
        },\
        \"AlpnPolicy\":{\
          \"shape\":\"AlpnPolicyName\",\
          \"documentation\":\"<p>[TLS listeners] The name of the Application-Layer Protocol Negotiation (ALPN) policy. You can specify one policy name. The following are the possible values:</p> <ul> <li> <p> <code>HTTP1Only</code> </p> </li> <li> <p> <code>HTTP2Only</code> </p> </li> <li> <p> <code>HTTP2Optional</code> </p> </li> <li> <p> <code>HTTP2Preferred</code> </p> </li> <li> <p> <code>None</code> </p> </li> </ul> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#alpn-policies\\\">ALPN policies</a> in the <i>Network Load Balancers Guide</i>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags to assign to the listener.</p>\"\
        },\
        \"MutualAuthentication\":{\
          \"shape\":\"MutualAuthenticationAttributes\",\
          \"documentation\":\"<p>The mutual authentication configuration information.</p>\"\
        }\
      }\
    },\
    \"CreateListenerOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Listeners\":{\
          \"shape\":\"Listeners\",\
          \"documentation\":\"<p>Information about the listener.</p>\"\
        }\
      }\
    },\
    \"CreateLoadBalancerInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"LoadBalancerName\",\
          \"documentation\":\"<p>The name of the load balancer.</p> <p>This name must be unique per region per account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, must not begin or end with a hyphen, and must not begin with \\\"internal-\\\".</p>\"\
        },\
        \"Subnets\":{\
          \"shape\":\"Subnets\",\
          \"documentation\":\"<p>The IDs of the subnets. You can specify only one subnet per Availability Zone. You must specify either subnets or subnet mappings, but not both. To specify an Elastic IP address, specify subnet mappings instead of subnets.</p> <p>[Application Load Balancers] You must specify subnets from at least two Availability Zones.</p> <p>[Application Load Balancers on Outposts] You must specify one Outpost subnet.</p> <p>[Application Load Balancers on Local Zones] You can specify subnets from one or more Local Zones.</p> <p>[Network Load Balancers] You can specify subnets from one or more Availability Zones.</p> <p>[Gateway Load Balancers] You can specify subnets from one or more Availability Zones.</p>\"\
        },\
        \"SubnetMappings\":{\
          \"shape\":\"SubnetMappings\",\
          \"documentation\":\"<p>The IDs of the subnets. You can specify only one subnet per Availability Zone. You must specify either subnets or subnet mappings, but not both.</p> <p>[Application Load Balancers] You must specify subnets from at least two Availability Zones. You cannot specify Elastic IP addresses for your subnets.</p> <p>[Application Load Balancers on Outposts] You must specify one Outpost subnet.</p> <p>[Application Load Balancers on Local Zones] You can specify subnets from one or more Local Zones.</p> <p>[Network Load Balancers] You can specify subnets from one or more Availability Zones. You can specify one Elastic IP address per subnet if you need static IP addresses for your internet-facing load balancer. For internal load balancers, you can specify one private IP address per subnet from the IPv4 range of the subnet. For internet-facing load balancer, you can specify one IPv6 address per subnet.</p> <p>[Gateway Load Balancers] You can specify subnets from one or more Availability Zones. You cannot specify Elastic IP addresses for your subnets.</p>\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"SecurityGroups\",\
          \"documentation\":\"<p>[Application Load Balancers and Network Load Balancers] The IDs of the security groups for the load balancer.</p>\"\
        },\
        \"Scheme\":{\
          \"shape\":\"LoadBalancerSchemeEnum\",\
          \"documentation\":\"<p>The nodes of an Internet-facing load balancer have public IP addresses. The DNS name of an Internet-facing load balancer is publicly resolvable to the public IP addresses of the nodes. Therefore, Internet-facing load balancers can route requests from clients over the internet.</p> <p>The nodes of an internal load balancer have only private IP addresses. The DNS name of an internal load balancer is publicly resolvable to the private IP addresses of the nodes. Therefore, internal load balancers can route requests only from clients with access to the VPC for the load balancer.</p> <p>The default is an Internet-facing load balancer.</p> <p>You cannot specify a scheme for a Gateway Load Balancer.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags to assign to the load balancer.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"LoadBalancerTypeEnum\",\
          \"documentation\":\"<p>The type of load balancer. The default is <code>application</code>.</p>\"\
        },\
        \"IpAddressType\":{\
          \"shape\":\"IpAddressType\",\
          \"documentation\":\"<p>Note: Internal load balancers must use the <code>ipv4</code> IP address type.</p> <p>[Application Load Balancers] The IP address type. The possible values are <code>ipv4</code> (for only IPv4 addresses), <code>dualstack</code> (for IPv4 and IPv6 addresses), and <code>dualstack-without-public-ipv4</code> (for IPv6 only public addresses, with private IPv4 and IPv6 addresses).</p> <p>[Network Load Balancers] The IP address type. The possible values are <code>ipv4</code> (for only IPv4 addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses). You canât specify <code>dualstack</code> for a load balancer with a UDP or TCP_UDP listener.</p> <p>[Gateway Load Balancers] The IP address type. The possible values are <code>ipv4</code> (for only IPv4 addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses).</p>\"\
        },\
        \"CustomerOwnedIpv4Pool\":{\
          \"shape\":\"CustomerOwnedIpv4Pool\",\
          \"documentation\":\"<p>[Application Load Balancers on Outposts] The ID of the customer-owned address pool (CoIP pool).</p>\"\
        }\
      }\
    },\
    \"CreateLoadBalancerOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancers\":{\
          \"shape\":\"LoadBalancers\",\
          \"documentation\":\"<p>Information about the load balancer.</p>\"\
        }\
      }\
    },\
    \"CreateRuleInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ListenerArn\",\
        \"Conditions\",\
        \"Priority\",\
        \"Actions\"\
      ],\
      \"members\":{\
        \"ListenerArn\":{\
          \"shape\":\"ListenerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the listener.</p>\"\
        },\
        \"Conditions\":{\
          \"shape\":\"RuleConditionList\",\
          \"documentation\":\"<p>The conditions.</p>\"\
        },\
        \"Priority\":{\
          \"shape\":\"RulePriority\",\
          \"documentation\":\"<p>The rule priority. A listener can't have multiple rules with the same priority.</p>\"\
        },\
        \"Actions\":{\
          \"shape\":\"Actions\",\
          \"documentation\":\"<p>The actions.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags to assign to the rule.</p>\"\
        }\
      }\
    },\
    \"CreateRuleOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Rules\":{\
          \"shape\":\"Rules\",\
          \"documentation\":\"<p>Information about the rule.</p>\"\
        }\
      }\
    },\
    \"CreateTargetGroupInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"TargetGroupName\",\
          \"documentation\":\"<p>The name of the target group.</p> <p>This name must be unique per region per account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen.</p>\"\
        },\
        \"Protocol\":{\
          \"shape\":\"ProtocolEnum\",\
          \"documentation\":\"<p>The protocol to use for routing traffic to the targets. For Application Load Balancers, the supported protocols are HTTP and HTTPS. For Network Load Balancers, the supported protocols are TCP, TLS, UDP, or TCP_UDP. For Gateway Load Balancers, the supported protocol is GENEVE. A TCP_UDP listener must be associated with a TCP_UDP target group. If the target is a Lambda function, this parameter does not apply.</p>\"\
        },\
        \"ProtocolVersion\":{\
          \"shape\":\"ProtocolVersion\",\
          \"documentation\":\"<p>[HTTP/HTTPS protocol] The protocol version. Specify <code>GRPC</code> to send requests to targets using gRPC. Specify <code>HTTP2</code> to send requests to targets using HTTP/2. The default is <code>HTTP1</code>, which sends requests to targets using HTTP/1.1.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The port on which the targets receive traffic. This port is used unless you specify a port override when registering the target. If the target is a Lambda function, this parameter does not apply. If the protocol is GENEVE, the supported port is 6081.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"VpcId\",\
          \"documentation\":\"<p>The identifier of the virtual private cloud (VPC). If the target is a Lambda function, this parameter does not apply. Otherwise, this parameter is required.</p>\"\
        },\
        \"HealthCheckProtocol\":{\
          \"shape\":\"ProtocolEnum\",\
          \"documentation\":\"<p>The protocol the load balancer uses when performing health checks on targets. For Application Load Balancers, the default is HTTP. For Network Load Balancers and Gateway Load Balancers, the default is TCP. The TCP protocol is not supported for health checks if the protocol of the target group is HTTP or HTTPS. The GENEVE, TLS, UDP, and TCP_UDP protocols are not supported for health checks.</p>\"\
        },\
        \"HealthCheckPort\":{\
          \"shape\":\"HealthCheckPort\",\
          \"documentation\":\"<p>The port the load balancer uses when performing health checks on targets. If the protocol is HTTP, HTTPS, TCP, TLS, UDP, or TCP_UDP, the default is <code>traffic-port</code>, which is the port on which each target receives traffic from the load balancer. If the protocol is GENEVE, the default is port 80.</p>\"\
        },\
        \"HealthCheckEnabled\":{\
          \"shape\":\"HealthCheckEnabled\",\
          \"documentation\":\"<p>Indicates whether health checks are enabled. If the target type is <code>lambda</code>, health checks are disabled by default but can be enabled. If the target type is <code>instance</code>, <code>ip</code>, or <code>alb</code>, health checks are always enabled and cannot be disabled.</p>\"\
        },\
        \"HealthCheckPath\":{\
          \"shape\":\"Path\",\
          \"documentation\":\"<p>[HTTP/HTTPS health checks] The destination for health checks on the targets.</p> <p>[HTTP1 or HTTP2 protocol version] The ping path. The default is /.</p> <p>[GRPC protocol version] The path of a custom health check method with the format /package.service/method. The default is /Amazon Web Services.ALB/healthcheck.</p>\"\
        },\
        \"HealthCheckIntervalSeconds\":{\
          \"shape\":\"HealthCheckIntervalSeconds\",\
          \"documentation\":\"<p>The approximate amount of time, in seconds, between health checks of an individual target. The range is 5-300. If the target group protocol is TCP, TLS, UDP, TCP_UDP, HTTP or HTTPS, the default is 30 seconds. If the target group protocol is GENEVE, the default is 10 seconds. If the target type is <code>lambda</code>, the default is 35 seconds.</p>\"\
        },\
        \"HealthCheckTimeoutSeconds\":{\
          \"shape\":\"HealthCheckTimeoutSeconds\",\
          \"documentation\":\"<p>The amount of time, in seconds, during which no response from a target means a failed health check. The range is 2â120 seconds. For target groups with a protocol of HTTP, the default is 6 seconds. For target groups with a protocol of TCP, TLS or HTTPS, the default is 10 seconds. For target groups with a protocol of GENEVE, the default is 5 seconds. If the target type is <code>lambda</code>, the default is 30 seconds.</p>\"\
        },\
        \"HealthyThresholdCount\":{\
          \"shape\":\"HealthCheckThresholdCount\",\
          \"documentation\":\"<p>The number of consecutive health check successes required before considering a target healthy. The range is 2-10. If the target group protocol is TCP, TCP_UDP, UDP, TLS, HTTP or HTTPS, the default is 5. For target groups with a protocol of GENEVE, the default is 5. If the target type is <code>lambda</code>, the default is 5.</p>\"\
        },\
        \"UnhealthyThresholdCount\":{\
          \"shape\":\"HealthCheckThresholdCount\",\
          \"documentation\":\"<p>The number of consecutive health check failures required before considering a target unhealthy. The range is 2-10. If the target group protocol is TCP, TCP_UDP, UDP, TLS, HTTP or HTTPS, the default is 2. For target groups with a protocol of GENEVE, the default is 2. If the target type is <code>lambda</code>, the default is 5.</p>\"\
        },\
        \"Matcher\":{\
          \"shape\":\"Matcher\",\
          \"documentation\":\"<p>[HTTP/HTTPS health checks] The HTTP or gRPC codes to use when checking for a successful response from a target. For target groups with a protocol of TCP, TCP_UDP, UDP or TLS the range is 200-599. For target groups with a protocol of HTTP or HTTPS, the range is 200-499. For target groups with a protocol of GENEVE, the range is 200-399.</p>\"\
        },\
        \"TargetType\":{\
          \"shape\":\"TargetTypeEnum\",\
          \"documentation\":\"<p>The type of target that you must specify when registering targets with this target group. You can't specify targets for a target group using more than one target type.</p> <ul> <li> <p> <code>instance</code> - Register targets by instance ID. This is the default value.</p> </li> <li> <p> <code>ip</code> - Register targets by IP address. You can specify IP addresses from the subnets of the virtual private cloud (VPC) for the target group, the RFC 1918 range (10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16), and the RFC 6598 range (100.64.0.0/10). You can't specify publicly routable IP addresses.</p> </li> <li> <p> <code>lambda</code> - Register a single Lambda function as a target.</p> </li> <li> <p> <code>alb</code> - Register a single Application Load Balancer as a target.</p> </li> </ul>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags to assign to the target group.</p>\"\
        },\
        \"IpAddressType\":{\
          \"shape\":\"TargetGroupIpAddressTypeEnum\",\
          \"documentation\":\"<p>The type of IP address used for this target group. The possible values are <code>ipv4</code> and <code>ipv6</code>. This is an optional parameter. If not specified, the IP address type defaults to <code>ipv4</code>.</p>\"\
        }\
      }\
    },\
    \"CreateTargetGroupOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TargetGroups\":{\
          \"shape\":\"TargetGroups\",\
          \"documentation\":\"<p>Information about the target group.</p>\"\
        }\
      }\
    },\
    \"CreateTrustStoreInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"CaCertificatesBundleS3Bucket\",\
        \"CaCertificatesBundleS3Key\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"TrustStoreName\",\
          \"documentation\":\"<p>The name of the trust store.</p> <p>This name must be unique per region and cannot be changed after creation.</p>\"\
        },\
        \"CaCertificatesBundleS3Bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>The Amazon S3 bucket for the ca certificates bundle.</p>\"\
        },\
        \"CaCertificatesBundleS3Key\":{\
          \"shape\":\"S3Key\",\
          \"documentation\":\"<p>The Amazon S3 path for the ca certificates bundle.</p>\"\
        },\
        \"CaCertificatesBundleS3ObjectVersion\":{\
          \"shape\":\"S3ObjectVersion\",\
          \"documentation\":\"<p>The Amazon S3 object version for the ca certificates bundle. If undefined the current version is used.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags to assign to the trust store.</p>\"\
        }\
      }\
    },\
    \"CreateTrustStoreOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrustStores\":{\
          \"shape\":\"TrustStores\",\
          \"documentation\":\"<p>Information about the trust store created.</p>\"\
        }\
      }\
    },\
    \"CreatedTime\":{\"type\":\"timestamp\"},\
    \"CustomerOwnedIpv4Pool\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"^(ipv4pool-coip-)[a-zA-Z0-9]+$\"\
    },\
    \"DNSName\":{\"type\":\"string\"},\
    \"Default\":{\"type\":\"boolean\"},\
    \"DeleteListenerInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ListenerArn\"],\
      \"members\":{\
        \"ListenerArn\":{\
          \"shape\":\"ListenerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the listener.</p>\"\
        }\
      }\
    },\
    \"DeleteListenerOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteLoadBalancerInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"LoadBalancerArn\"],\
      \"members\":{\
        \"LoadBalancerArn\":{\
          \"shape\":\"LoadBalancerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the load balancer.</p>\"\
        }\
      }\
    },\
    \"DeleteLoadBalancerOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteRuleInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"RuleArn\"],\
      \"members\":{\
        \"RuleArn\":{\
          \"shape\":\"RuleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the rule.</p>\"\
        }\
      }\
    },\
    \"DeleteRuleOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteTargetGroupInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TargetGroupArn\"],\
      \"members\":{\
        \"TargetGroupArn\":{\
          \"shape\":\"TargetGroupArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the target group.</p>\"\
        }\
      }\
    },\
    \"DeleteTargetGroupOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteTrustStoreInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrustStoreArn\"],\
      \"members\":{\
        \"TrustStoreArn\":{\
          \"shape\":\"TrustStoreArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trust store.</p>\"\
        }\
      }\
    },\
    \"DeleteTrustStoreOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeregisterTargetsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TargetGroupArn\",\
        \"Targets\"\
      ],\
      \"members\":{\
        \"TargetGroupArn\":{\
          \"shape\":\"TargetGroupArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the target group.</p>\"\
        },\
        \"Targets\":{\
          \"shape\":\"TargetDescriptions\",\
          \"documentation\":\"<p>The targets. If you specified a port override when you registered a target, you must specify both the target ID and the port when you deregister it.</p>\"\
        }\
      }\
    },\
    \"DeregisterTargetsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeAccountLimitsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results. (You received this marker from a previous call.)</p>\"\
        },\
        \"PageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The maximum number of results to return with this call.</p>\"\
        }\
      }\
    },\
    \"DescribeAccountLimitsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Limits\":{\
          \"shape\":\"Limits\",\
          \"documentation\":\"<p>Information about the limits.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>\"\
        }\
      }\
    },\
    \"DescribeListenerCertificatesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ListenerArn\"],\
      \"members\":{\
        \"ListenerArn\":{\
          \"shape\":\"ListenerArn\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the listener.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results. (You received this marker from a previous call.)</p>\"\
        },\
        \"PageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The maximum number of results to return with this call.</p>\"\
        }\
      }\
    },\
    \"DescribeListenerCertificatesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Certificates\":{\
          \"shape\":\"CertificateList\",\
          \"documentation\":\"<p>Information about the certificates.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>\"\
        }\
      }\
    },\
    \"DescribeListenersInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancerArn\":{\
          \"shape\":\"LoadBalancerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the load balancer.</p>\"\
        },\
        \"ListenerArns\":{\
          \"shape\":\"ListenerArns\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the listeners.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results. (You received this marker from a previous call.)</p>\"\
        },\
        \"PageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The maximum number of results to return with this call.</p>\"\
        }\
      }\
    },\
    \"DescribeListenersOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Listeners\":{\
          \"shape\":\"Listeners\",\
          \"documentation\":\"<p>Information about the listeners.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>\"\
        }\
      }\
    },\
    \"DescribeLoadBalancerAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"LoadBalancerArn\"],\
      \"members\":{\
        \"LoadBalancerArn\":{\
          \"shape\":\"LoadBalancerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the load balancer.</p>\"\
        }\
      }\
    },\
    \"DescribeLoadBalancerAttributesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attributes\":{\
          \"shape\":\"LoadBalancerAttributes\",\
          \"documentation\":\"<p>Information about the load balancer attributes.</p>\"\
        }\
      }\
    },\
    \"DescribeLoadBalancersInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancerArns\":{\
          \"shape\":\"LoadBalancerArns\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the load balancers. You can specify up to 20 load balancers in a single call.</p>\"\
        },\
        \"Names\":{\
          \"shape\":\"LoadBalancerNames\",\
          \"documentation\":\"<p>The names of the load balancers.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results. (You received this marker from a previous call.)</p>\"\
        },\
        \"PageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The maximum number of results to return with this call.</p>\"\
        }\
      }\
    },\
    \"DescribeLoadBalancersOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancers\":{\
          \"shape\":\"LoadBalancers\",\
          \"documentation\":\"<p>Information about the load balancers.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>\"\
        }\
      }\
    },\
    \"DescribeRulesInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ListenerArn\":{\
          \"shape\":\"ListenerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the listener.</p>\"\
        },\
        \"RuleArns\":{\
          \"shape\":\"RuleArns\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the rules.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results. (You received this marker from a previous call.)</p>\"\
        },\
        \"PageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The maximum number of results to return with this call.</p>\"\
        }\
      }\
    },\
    \"DescribeRulesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Rules\":{\
          \"shape\":\"Rules\",\
          \"documentation\":\"<p>Information about the rules.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>\"\
        }\
      }\
    },\
    \"DescribeSSLPoliciesInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Names\":{\
          \"shape\":\"SslPolicyNames\",\
          \"documentation\":\"<p>The names of the policies.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results. (You received this marker from a previous call.)</p>\"\
        },\
        \"PageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The maximum number of results to return with this call.</p>\"\
        },\
        \"LoadBalancerType\":{\
          \"shape\":\"LoadBalancerTypeEnum\",\
          \"documentation\":\"<p> The type of load balancer. The default lists the SSL policies for all load balancers.</p>\"\
        }\
      }\
    },\
    \"DescribeSSLPoliciesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SslPolicies\":{\
          \"shape\":\"SslPolicies\",\
          \"documentation\":\"<p>Information about the security policies.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>\"\
        }\
      }\
    },\
    \"DescribeTagsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArns\"],\
      \"members\":{\
        \"ResourceArns\":{\
          \"shape\":\"ResourceArns\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the resources. You can specify up to 20 resources in a single call.</p>\"\
        }\
      }\
    },\
    \"DescribeTagsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TagDescriptions\":{\
          \"shape\":\"TagDescriptions\",\
          \"documentation\":\"<p>Information about the tags.</p>\"\
        }\
      }\
    },\
    \"DescribeTargetGroupAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TargetGroupArn\"],\
      \"members\":{\
        \"TargetGroupArn\":{\
          \"shape\":\"TargetGroupArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the target group.</p>\"\
        }\
      }\
    },\
    \"DescribeTargetGroupAttributesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attributes\":{\
          \"shape\":\"TargetGroupAttributes\",\
          \"documentation\":\"<p>Information about the target group attributes</p>\"\
        }\
      }\
    },\
    \"DescribeTargetGroupsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancerArn\":{\
          \"shape\":\"LoadBalancerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the load balancer.</p>\"\
        },\
        \"TargetGroupArns\":{\
          \"shape\":\"TargetGroupArns\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the target groups.</p>\"\
        },\
        \"Names\":{\
          \"shape\":\"TargetGroupNames\",\
          \"documentation\":\"<p>The names of the target groups.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results. (You received this marker from a previous call.)</p>\"\
        },\
        \"PageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The maximum number of results to return with this call.</p>\"\
        }\
      }\
    },\
    \"DescribeTargetGroupsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TargetGroups\":{\
          \"shape\":\"TargetGroups\",\
          \"documentation\":\"<p>Information about the target groups.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>\"\
        }\
      }\
    },\
    \"DescribeTargetHealthInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TargetGroupArn\"],\
      \"members\":{\
        \"TargetGroupArn\":{\
          \"shape\":\"TargetGroupArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the target group.</p>\"\
        },\
        \"Targets\":{\
          \"shape\":\"TargetDescriptions\",\
          \"documentation\":\"<p>The targets.</p>\"\
        },\
        \"Include\":{\
          \"shape\":\"ListOfDescribeTargetHealthIncludeOptions\",\
          \"documentation\":\"<p>Used to inclue anomaly detection information.</p>\"\
        }\
      }\
    },\
    \"DescribeTargetHealthInputIncludeEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AnomalyDetection\",\
        \"All\"\
      ]\
    },\
    \"DescribeTargetHealthOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TargetHealthDescriptions\":{\
          \"shape\":\"TargetHealthDescriptions\",\
          \"documentation\":\"<p>Information about the health of the targets.</p>\"\
        }\
      }\
    },\
    \"DescribeTrustStoreAssociationsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrustStoreArn\"],\
      \"members\":{\
        \"TrustStoreArn\":{\
          \"shape\":\"TrustStoreArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trust store.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results. (You received this marker from a previous call.)</p>\"\
        },\
        \"PageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The maximum number of results to return with this call.</p>\"\
        }\
      }\
    },\
    \"DescribeTrustStoreAssociationsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrustStoreAssociations\":{\
          \"shape\":\"TrustStoreAssociations\",\
          \"documentation\":\"<p>Information about the resources the trust store is associated to.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>\"\
        }\
      }\
    },\
    \"DescribeTrustStoreRevocation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrustStoreArn\":{\
          \"shape\":\"TrustStoreArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trust store.</p>\"\
        },\
        \"RevocationId\":{\
          \"shape\":\"RevocationId\",\
          \"documentation\":\"<p>The revocation ID of a revocation file in use.</p>\"\
        },\
        \"RevocationType\":{\
          \"shape\":\"RevocationType\",\
          \"documentation\":\"<p>The type of revocation file.</p>\"\
        },\
        \"NumberOfRevokedEntries\":{\
          \"shape\":\"NumberOfRevokedEntries\",\
          \"documentation\":\"<p>The number of revoked certificates.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the revocations used by a trust store.</p>\"\
    },\
    \"DescribeTrustStoreRevocationResponse\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DescribeTrustStoreRevocation\"}\
    },\
    \"DescribeTrustStoreRevocationsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrustStoreArn\"],\
      \"members\":{\
        \"TrustStoreArn\":{\
          \"shape\":\"TrustStoreArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trust store.</p>\"\
        },\
        \"RevocationIds\":{\
          \"shape\":\"RevocationIds\",\
          \"documentation\":\"<p>The revocation IDs of the revocation files you want to describe.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results. (You received this marker from a previous call.)</p>\"\
        },\
        \"PageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The maximum number of results to return with this call.</p>\"\
        }\
      }\
    },\
    \"DescribeTrustStoreRevocationsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrustStoreRevocations\":{\
          \"shape\":\"DescribeTrustStoreRevocationResponse\",\
          \"documentation\":\"<p>Information about the revocation file in the trust store.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>\"\
        }\
      }\
    },\
    \"DescribeTrustStoresInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrustStoreArns\":{\
          \"shape\":\"TrustStoreArns\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trust store.</p>\"\
        },\
        \"Names\":{\
          \"shape\":\"TrustStoreNames\",\
          \"documentation\":\"<p>The names of the trust stores.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results. (You received this marker from a previous call.)</p>\"\
        },\
        \"PageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The maximum number of results to return with this call.</p>\"\
        }\
      }\
    },\
    \"DescribeTrustStoresOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrustStores\":{\
          \"shape\":\"TrustStores\",\
          \"documentation\":\"<p>Information about the trust stores.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>\"\
        }\
      }\
    },\
    \"Description\":{\"type\":\"string\"},\
    \"DuplicateListenerException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A listener with the specified port already exists.</p>\",\
      \"error\":{\
        \"code\":\"DuplicateListener\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"DuplicateLoadBalancerNameException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A load balancer with the specified name already exists.</p>\",\
      \"error\":{\
        \"code\":\"DuplicateLoadBalancerName\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"DuplicateTagKeysException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A tag key was specified more than once.</p>\",\
      \"error\":{\
        \"code\":\"DuplicateTagKeys\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"DuplicateTargetGroupNameException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A target group with the specified name already exists.</p>\",\
      \"error\":{\
        \"code\":\"DuplicateTargetGroupName\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"DuplicateTrustStoreNameException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A trust store with the specified name already exists.</p>\",\
      \"error\":{\
        \"code\":\"DuplicateTrustStoreName\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic\":{\"type\":\"string\"},\
    \"EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"on\",\
        \"off\"\
      ]\
    },\
    \"FixedResponseActionConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"StatusCode\"],\
      \"members\":{\
        \"MessageBody\":{\
          \"shape\":\"FixedResponseActionMessage\",\
          \"documentation\":\"<p>The message.</p>\"\
        },\
        \"StatusCode\":{\
          \"shape\":\"FixedResponseActionStatusCode\",\
          \"documentation\":\"<p>The HTTP response code (2XX, 4XX, or 5XX).</p>\"\
        },\
        \"ContentType\":{\
          \"shape\":\"FixedResponseActionContentType\",\
          \"documentation\":\"<p>The content type.</p> <p>Valid Values: text/plain | text/css | text/html | application/javascript | application/json</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an action that returns a custom HTTP response.</p>\"\
    },\
    \"FixedResponseActionContentType\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":0\
    },\
    \"FixedResponseActionMessage\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"FixedResponseActionStatusCode\":{\
      \"type\":\"string\",\
      \"pattern\":\"^(2|4|5)\\\\d\\\\d$\"\
    },\
    \"ForwardActionConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TargetGroups\":{\
          \"shape\":\"TargetGroupList\",\
          \"documentation\":\"<p>The target groups. For Network Load Balancers, you can specify a single target group.</p>\"\
        },\
        \"TargetGroupStickinessConfig\":{\
          \"shape\":\"TargetGroupStickinessConfig\",\
          \"documentation\":\"<p>The target group stickiness for the rule.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a forward action.</p>\"\
    },\
    \"GetTrustStoreCaCertificatesBundleInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrustStoreArn\"],\
      \"members\":{\
        \"TrustStoreArn\":{\
          \"shape\":\"TrustStoreArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trust store.</p>\"\
        }\
      }\
    },\
    \"GetTrustStoreCaCertificatesBundleOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Location\":{\
          \"shape\":\"Location\",\
          \"documentation\":\"<p>The ca certificate bundles Amazon S3 URI.</p>\"\
        }\
      }\
    },\
    \"GetTrustStoreRevocationContentInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrustStoreArn\",\
        \"RevocationId\"\
      ],\
      \"members\":{\
        \"TrustStoreArn\":{\
          \"shape\":\"TrustStoreArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trust store.</p>\"\
        },\
        \"RevocationId\":{\
          \"shape\":\"RevocationId\",\
          \"documentation\":\"<p>The revocation ID of the revocation file.</p>\"\
        }\
      }\
    },\
    \"GetTrustStoreRevocationContentOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Location\":{\
          \"shape\":\"Location\",\
          \"documentation\":\"<p>The revocation files Amazon S3 URI.</p>\"\
        }\
      }\
    },\
    \"GrpcCode\":{\"type\":\"string\"},\
    \"HealthCheckEnabled\":{\"type\":\"boolean\"},\
    \"HealthCheckIntervalSeconds\":{\
      \"type\":\"integer\",\
      \"max\":300,\
      \"min\":5\
    },\
    \"HealthCheckPort\":{\"type\":\"string\"},\
    \"HealthCheckThresholdCount\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":2\
    },\
    \"HealthCheckTimeoutSeconds\":{\
      \"type\":\"integer\",\
      \"max\":120,\
      \"min\":2\
    },\
    \"HealthUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The health of the specified targets could not be retrieved due to an internal error.</p>\",\
      \"error\":{\
        \"code\":\"HealthUnavailable\",\
        \"httpStatusCode\":500\
      },\
      \"exception\":true\
    },\
    \"HostHeaderConditionConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Values\":{\
          \"shape\":\"ListOfString\",\
          \"documentation\":\"<p>The host names. The maximum size of each name is 128 characters. The comparison is case insensitive. The following wildcard characters are supported: * (matches 0 or more characters) and ? (matches exactly 1 character).</p> <p>If you specify multiple strings, the condition is satisfied if one of the strings matches the host name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a host header condition.</p>\"\
    },\
    \"HttpCode\":{\"type\":\"string\"},\
    \"HttpHeaderConditionConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HttpHeaderName\":{\
          \"shape\":\"HttpHeaderConditionName\",\
          \"documentation\":\"<p>The name of the HTTP header field. The maximum size is 40 characters. The header name is case insensitive. The allowed characters are specified by RFC 7230. Wildcards are not supported.</p> <p>You can't use an HTTP header condition to specify the host header. Use <a>HostHeaderConditionConfig</a> to specify a host header condition.</p>\"\
        },\
        \"Values\":{\
          \"shape\":\"ListOfString\",\
          \"documentation\":\"<p>The strings to compare against the value of the HTTP header. The maximum size of each string is 128 characters. The comparison strings are case insensitive. The following wildcard characters are supported: * (matches 0 or more characters) and ? (matches exactly 1 character).</p> <p>If the same header appears multiple times in the request, we search them in order until a match is found.</p> <p>If you specify multiple strings, the condition is satisfied if one of the strings matches the value of the HTTP header. To require that all of the strings are a match, create one condition per string.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an HTTP header condition.</p> <p>There is a set of standard HTTP header fields. You can also define custom HTTP header fields.</p>\"\
    },\
    \"HttpHeaderConditionName\":{\"type\":\"string\"},\
    \"HttpRequestMethodConditionConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Values\":{\
          \"shape\":\"ListOfString\",\
          \"documentation\":\"<p>The name of the request method. The maximum size is 40 characters. The allowed characters are A-Z, hyphen (-), and underscore (_). The comparison is case sensitive. Wildcards are not supported; therefore, the method name must be an exact match.</p> <p>If you specify multiple strings, the condition is satisfied if one of the strings matches the HTTP request method. We recommend that you route GET and HEAD requests in the same way, because the response to a HEAD request may be cached.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an HTTP method condition.</p> <p>HTTP defines a set of request methods, also referred to as HTTP verbs. For more information, see the <a href=\\\"https://www.iana.org/assignments/http-methods/http-methods.xhtml\\\">HTTP Method Registry</a>. You can also define custom HTTP methods.</p>\"\
    },\
    \"IPv6Address\":{\"type\":\"string\"},\
    \"IgnoreClientCertificateExpiry\":{\"type\":\"boolean\"},\
    \"IncompatibleProtocolsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified configuration is not valid with this protocol.</p>\",\
      \"error\":{\
        \"code\":\"IncompatibleProtocols\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidCaCertificatesBundleException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified ca certificate bundle is in an invalid format, or corrupt.</p>\",\
      \"error\":{\
        \"code\":\"InvalidCaCertificatesBundle\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidConfigurationRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested configuration is not valid.</p>\",\
      \"error\":{\
        \"code\":\"InvalidConfigurationRequest\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidLoadBalancerActionException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested action is not valid.</p>\",\
      \"error\":{\
        \"code\":\"InvalidLoadBalancerAction\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidRevocationContentException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The provided revocation file is an invalid format, or uses an incorrect algorithm.</p>\",\
      \"error\":{\
        \"code\":\"InvalidRevocationContent\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidSchemeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested scheme is not valid.</p>\",\
      \"error\":{\
        \"code\":\"InvalidScheme\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidSecurityGroupException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified security group does not exist.</p>\",\
      \"error\":{\
        \"code\":\"InvalidSecurityGroup\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidSubnetException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified subnet is out of available addresses.</p>\",\
      \"error\":{\
        \"code\":\"InvalidSubnet\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidTargetException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified target does not exist, is not in the same VPC as the target group, or has an unsupported instance type.</p>\",\
      \"error\":{\
        \"code\":\"InvalidTarget\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"IpAddress\":{\"type\":\"string\"},\
    \"IpAddressType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ipv4\",\
        \"dualstack\",\
        \"dualstack-without-public-ipv4\"\
      ]\
    },\
    \"IsDefault\":{\"type\":\"boolean\"},\
    \"Limit\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the limit. The possible values are:</p> <ul> <li> <p>application-load-balancers</p> </li> <li> <p>condition-values-per-alb-rule</p> </li> <li> <p>condition-wildcards-per-alb-rule</p> </li> <li> <p>gateway-load-balancers</p> </li> <li> <p>gateway-load-balancers-per-vpc</p> </li> <li> <p>geneve-target-groups</p> </li> <li> <p>listeners-per-application-load-balancer</p> </li> <li> <p>listeners-per-network-load-balancer</p> </li> <li> <p>network-load-balancers</p> </li> <li> <p>rules-per-application-load-balancer</p> </li> <li> <p>target-groups</p> </li> <li> <p>target-groups-per-action-on-application-load-balancer</p> </li> <li> <p>target-groups-per-action-on-network-load-balancer</p> </li> <li> <p>target-groups-per-application-load-balancer</p> </li> <li> <p>targets-per-application-load-balancer</p> </li> <li> <p>targets-per-availability-zone-per-gateway-load-balancer</p> </li> <li> <p>targets-per-availability-zone-per-network-load-balancer</p> </li> <li> <p>targets-per-network-load-balancer</p> </li> </ul>\"\
        },\
        \"Max\":{\
          \"shape\":\"Max\",\
          \"documentation\":\"<p>The maximum value of the limit.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an Elastic Load Balancing resource limit for your Amazon Web Services account.</p> <p>For more information, see the following:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html\\\">Quotas for your Application Load Balancers</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-limits.html\\\">Quotas for your Network Load Balancers</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/quotas-limits.html\\\">Quotas for your Gateway Load Balancers</a> </p> </li> </ul>\"\
    },\
    \"Limits\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Limit\"}\
    },\
    \"ListOfDescribeTargetHealthIncludeOptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DescribeTargetHealthInputIncludeEnum\"}\
    },\
    \"ListOfString\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StringValue\"}\
    },\
    \"Listener\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ListenerArn\":{\
          \"shape\":\"ListenerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the listener.</p>\"\
        },\
        \"LoadBalancerArn\":{\
          \"shape\":\"LoadBalancerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the load balancer.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The port on which the load balancer is listening.</p>\"\
        },\
        \"Protocol\":{\
          \"shape\":\"ProtocolEnum\",\
          \"documentation\":\"<p>The protocol for connections from clients to the load balancer.</p>\"\
        },\
        \"Certificates\":{\
          \"shape\":\"CertificateList\",\
          \"documentation\":\"<p>[HTTPS or TLS listener] The default certificate for the listener.</p>\"\
        },\
        \"SslPolicy\":{\
          \"shape\":\"SslPolicyName\",\
          \"documentation\":\"<p>[HTTPS or TLS listener] The security policy that defines which protocols and ciphers are supported.</p>\"\
        },\
        \"DefaultActions\":{\
          \"shape\":\"Actions\",\
          \"documentation\":\"<p>The default actions for the listener.</p>\"\
        },\
        \"AlpnPolicy\":{\
          \"shape\":\"AlpnPolicyName\",\
          \"documentation\":\"<p>[TLS listener] The name of the Application-Layer Protocol Negotiation (ALPN) policy.</p>\"\
        },\
        \"MutualAuthentication\":{\
          \"shape\":\"MutualAuthenticationAttributes\",\
          \"documentation\":\"<p>The mutual authentication configuration information.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a listener.</p>\"\
    },\
    \"ListenerArn\":{\"type\":\"string\"},\
    \"ListenerArns\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ListenerArn\"}\
    },\
    \"ListenerNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified listener does not exist.</p>\",\
      \"error\":{\
        \"code\":\"ListenerNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Listeners\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Listener\"}\
    },\
    \"LoadBalancer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancerArn\":{\
          \"shape\":\"LoadBalancerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the load balancer.</p>\"\
        },\
        \"DNSName\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>The public DNS name of the load balancer.</p>\"\
        },\
        \"CanonicalHostedZoneId\":{\
          \"shape\":\"CanonicalHostedZoneId\",\
          \"documentation\":\"<p>The ID of the Amazon Route 53 hosted zone associated with the load balancer.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"CreatedTime\",\
          \"documentation\":\"<p>The date and time the load balancer was created.</p>\"\
        },\
        \"LoadBalancerName\":{\
          \"shape\":\"LoadBalancerName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"Scheme\":{\
          \"shape\":\"LoadBalancerSchemeEnum\",\
          \"documentation\":\"<p>The nodes of an Internet-facing load balancer have public IP addresses. The DNS name of an Internet-facing load balancer is publicly resolvable to the public IP addresses of the nodes. Therefore, Internet-facing load balancers can route requests from clients over the internet.</p> <p>The nodes of an internal load balancer have only private IP addresses. The DNS name of an internal load balancer is publicly resolvable to the private IP addresses of the nodes. Therefore, internal load balancers can route requests only from clients with access to the VPC for the load balancer.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"VpcId\",\
          \"documentation\":\"<p>The ID of the VPC for the load balancer.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"LoadBalancerState\",\
          \"documentation\":\"<p>The state of the load balancer.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"LoadBalancerTypeEnum\",\
          \"documentation\":\"<p>The type of load balancer.</p>\"\
        },\
        \"AvailabilityZones\":{\
          \"shape\":\"AvailabilityZones\",\
          \"documentation\":\"<p>The subnets for the load balancer.</p>\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"SecurityGroups\",\
          \"documentation\":\"<p>The IDs of the security groups for the load balancer.</p>\"\
        },\
        \"IpAddressType\":{\
          \"shape\":\"IpAddressType\",\
          \"documentation\":\"<p>[Application Load Balancers] The type of IP addresses used for public or private connections by the subnets attached to your load balancer. The possible values are <code>ipv4</code> (for only IPv4 addresses), <code>dualstack</code> (for IPv4 and IPv6 addresses), and <code>dualstack-without-public-ipv4</code> (for IPv6 only public addresses, with private IPv4 and IPv6 addresses).</p> <p>[Network Load Balancers and Gateway Load Balancers] The type of IP addresses used for public or private connections by the subnets attached to your load balancer. The possible values are <code>ipv4</code> (for only IPv4 addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses).</p>\"\
        },\
        \"CustomerOwnedIpv4Pool\":{\
          \"shape\":\"CustomerOwnedIpv4Pool\",\
          \"documentation\":\"<p>[Application Load Balancers on Outposts] The ID of the customer-owned address pool.</p>\"\
        },\
        \"EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic\":{\
          \"shape\":\"EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic\",\
          \"documentation\":\"<p>Indicates whether to evaluate inbound security group rules for traffic sent to a Network Load Balancer through Amazon Web Services PrivateLink.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a load balancer.</p>\"\
    },\
    \"LoadBalancerAddress\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IpAddress\":{\
          \"shape\":\"IpAddress\",\
          \"documentation\":\"<p>The static IP address.</p>\"\
        },\
        \"AllocationId\":{\
          \"shape\":\"AllocationId\",\
          \"documentation\":\"<p>[Network Load Balancers] The allocation ID of the Elastic IP address for an internal-facing load balancer.</p>\"\
        },\
        \"PrivateIPv4Address\":{\
          \"shape\":\"PrivateIPv4Address\",\
          \"documentation\":\"<p>[Network Load Balancers] The private IPv4 address for an internal load balancer.</p>\"\
        },\
        \"IPv6Address\":{\
          \"shape\":\"IPv6Address\",\
          \"documentation\":\"<p>[Network Load Balancers] The IPv6 address.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a static IP address for a load balancer.</p>\"\
    },\
    \"LoadBalancerAddresses\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LoadBalancerAddress\"}\
    },\
    \"LoadBalancerArn\":{\"type\":\"string\"},\
    \"LoadBalancerArns\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LoadBalancerArn\"}\
    },\
    \"LoadBalancerAttribute\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"LoadBalancerAttributeKey\",\
          \"documentation\":\"<p>The name of the attribute.</p> <p>The following attributes are supported by all load balancers:</p> <ul> <li> <p> <code>deletion_protection.enabled</code> - Indicates whether deletion protection is enabled. The value is <code>true</code> or <code>false</code>. The default is <code>false</code>.</p> </li> <li> <p> <code>load_balancing.cross_zone.enabled</code> - Indicates whether cross-zone load balancing is enabled. The possible values are <code>true</code> and <code>false</code>. The default for Network Load Balancers and Gateway Load Balancers is <code>false</code>. The default for Application Load Balancers is <code>true</code>, and cannot be changed.</p> </li> </ul> <p>The following attributes are supported by both Application Load Balancers and Network Load Balancers:</p> <ul> <li> <p> <code>access_logs.s3.enabled</code> - Indicates whether access logs are enabled. The value is <code>true</code> or <code>false</code>. The default is <code>false</code>.</p> </li> <li> <p> <code>access_logs.s3.bucket</code> - The name of the S3 bucket for the access logs. This attribute is required if access logs are enabled. The bucket must exist in the same region as the load balancer and have a bucket policy that grants Elastic Load Balancing permissions to write to the bucket.</p> </li> <li> <p> <code>access_logs.s3.prefix</code> - The prefix for the location in the S3 bucket for the access logs.</p> </li> <li> <p> <code>ipv6.deny_all_igw_traffic</code> - Blocks internet gateway (IGW) access to the load balancer. It is set to <code>false</code> for internet-facing load balancers and <code>true</code> for internal load balancers, preventing unintended access to your internal load balancer through an internet gateway.</p> </li> </ul> <p>The following attributes are supported by only Application Load Balancers:</p> <ul> <li> <p> <code>idle_timeout.timeout_seconds</code> - The idle timeout value, in seconds. The valid range is 1-4000 seconds. The default is 60 seconds.</p> </li> <li> <p> <code>client_keep_alive.seconds</code> - The client keep alive value, in seconds. The valid range is 60-604800 seconds. The default is 3600 seconds.</p> </li> <li> <p> <code>connection_logs.s3.enabled</code> - Indicates whether connection logs are enabled. The value is <code>true</code> or <code>false</code>. The default is <code>false</code>.</p> </li> <li> <p> <code>connection_logs.s3.bucket</code> - The name of the S3 bucket for the connection logs. This attribute is required if connection logs are enabled. The bucket must exist in the same region as the load balancer and have a bucket policy that grants Elastic Load Balancing permissions to write to the bucket.</p> </li> <li> <p> <code>connection_logs.s3.prefix</code> - The prefix for the location in the S3 bucket for the connection logs.</p> </li> <li> <p> <code>routing.http.desync_mitigation_mode</code> - Determines how the load balancer handles requests that might pose a security risk to your application. The possible values are <code>monitor</code>, <code>defensive</code>, and <code>strictest</code>. The default is <code>defensive</code>.</p> </li> <li> <p> <code>routing.http.drop_invalid_header_fields.enabled</code> - Indicates whether HTTP headers with invalid header fields are removed by the load balancer (<code>true</code>) or routed to targets (<code>false</code>). The default is <code>false</code>.</p> </li> <li> <p> <code>routing.http.preserve_host_header.enabled</code> - Indicates whether the Application Load Balancer should preserve the <code>Host</code> header in the HTTP request and send it to the target without any change. The possible values are <code>true</code> and <code>false</code>. The default is <code>false</code>.</p> </li> <li> <p> <code>routing.http.x_amzn_tls_version_and_cipher_suite.enabled</code> - Indicates whether the two headers (<code>x-amzn-tls-version</code> and <code>x-amzn-tls-cipher-suite</code>), which contain information about the negotiated TLS version and cipher suite, are added to the client request before sending it to the target. The <code>x-amzn-tls-version</code> header has information about the TLS protocol version negotiated with the client, and the <code>x-amzn-tls-cipher-suite</code> header has information about the cipher suite negotiated with the client. Both headers are in OpenSSL format. The possible values for the attribute are <code>true</code> and <code>false</code>. The default is <code>false</code>.</p> </li> <li> <p> <code>routing.http.xff_client_port.enabled</code> - Indicates whether the <code>X-Forwarded-For</code> header should preserve the source port that the client used to connect to the load balancer. The possible values are <code>true</code> and <code>false</code>. The default is <code>false</code>.</p> </li> <li> <p> <code>routing.http.xff_header_processing.mode</code> - Enables you to modify, preserve, or remove the <code>X-Forwarded-For</code> header in the HTTP request before the Application Load Balancer sends the request to the target. The possible values are <code>append</code>, <code>preserve</code>, and <code>remove</code>. The default is <code>append</code>.</p> <ul> <li> <p>If the value is <code>append</code>, the Application Load Balancer adds the client IP address (of the last hop) to the <code>X-Forwarded-For</code> header in the HTTP request before it sends it to targets.</p> </li> <li> <p>If the value is <code>preserve</code> the Application Load Balancer preserves the <code>X-Forwarded-For</code> header in the HTTP request, and sends it to targets without any change.</p> </li> <li> <p>If the value is <code>remove</code>, the Application Load Balancer removes the <code>X-Forwarded-For</code> header in the HTTP request before it sends it to targets.</p> </li> </ul> </li> <li> <p> <code>routing.http2.enabled</code> - Indicates whether HTTP/2 is enabled. The possible values are <code>true</code> and <code>false</code>. The default is <code>true</code>. Elastic Load Balancing requires that message header names contain only alphanumeric characters and hyphens.</p> </li> <li> <p> <code>waf.fail_open.enabled</code> - Indicates whether to allow a WAF-enabled load balancer to route requests to targets if it is unable to forward the request to Amazon Web Services WAF. The possible values are <code>true</code> and <code>false</code>. The default is <code>false</code>.</p> </li> </ul> <p>The following attributes are supported by only Network Load Balancers:</p> <ul> <li> <p> <code>dns_record.client_routing_policy</code> - Indicates how traffic is distributed among the load balancer Availability Zones. The possible values are <code>availability_zone_affinity</code> with 100 percent zonal affinity, <code>partial_availability_zone_affinity</code> with 85 percent zonal affinity, and <code>any_availability_zone</code> with 0 percent zonal affinity.</p> </li> </ul>\"\
        },\
        \"Value\":{\
          \"shape\":\"LoadBalancerAttributeValue\",\
          \"documentation\":\"<p>The value of the attribute.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a load balancer attribute.</p>\"\
    },\
    \"LoadBalancerAttributeKey\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"^[a-zA-Z0-9._]+$\"\
    },\
    \"LoadBalancerAttributeValue\":{\
      \"type\":\"string\",\
      \"max\":1024\
    },\
    \"LoadBalancerAttributes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LoadBalancerAttribute\"},\
      \"max\":20\
    },\
    \"LoadBalancerName\":{\"type\":\"string\"},\
    \"LoadBalancerNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LoadBalancerName\"}\
    },\
    \"LoadBalancerNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified load balancer does not exist.</p>\",\
      \"error\":{\
        \"code\":\"LoadBalancerNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"LoadBalancerSchemeEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"internet-facing\",\
        \"internal\"\
      ]\
    },\
    \"LoadBalancerState\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"LoadBalancerStateEnum\",\
          \"documentation\":\"<p>The state code. The initial state of the load balancer is <code>provisioning</code>. After the load balancer is fully set up and ready to route traffic, its state is <code>active</code>. If load balancer is routing traffic but does not have the resources it needs to scale, its state is<code>active_impaired</code>. If the load balancer could not be set up, its state is <code>failed</code>.</p>\"\
        },\
        \"Reason\":{\
          \"shape\":\"StateReason\",\
          \"documentation\":\"<p>A description of the state.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the state of the load balancer.</p>\"\
    },\
    \"LoadBalancerStateEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"active\",\
        \"provisioning\",\
        \"active_impaired\",\
        \"failed\"\
      ]\
    },\
    \"LoadBalancerTypeEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"application\",\
        \"network\",\
        \"gateway\"\
      ]\
    },\
    \"LoadBalancers\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LoadBalancer\"}\
    },\
    \"Location\":{\"type\":\"string\"},\
    \"Marker\":{\"type\":\"string\"},\
    \"Matcher\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HttpCode\":{\
          \"shape\":\"HttpCode\",\
          \"documentation\":\"<p>For Application Load Balancers, you can specify values between 200 and 499, with the default value being 200. You can specify multiple values (for example, \\\"200,202\\\") or a range of values (for example, \\\"200-299\\\").</p> <p>For Network Load Balancers, you can specify values between 200 and 599, with the default value being 200-399. You can specify multiple values (for example, \\\"200,202\\\") or a range of values (for example, \\\"200-299\\\").</p> <p>For Gateway Load Balancers, this must be \\\"200â399\\\".</p> <p>Note that when using shorthand syntax, some values such as commas need to be escaped.</p>\"\
        },\
        \"GrpcCode\":{\
          \"shape\":\"GrpcCode\",\
          \"documentation\":\"<p>You can specify values between 0 and 99. You can specify multiple values (for example, \\\"0,1\\\") or a range of values (for example, \\\"0-5\\\"). The default value is 12.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The codes to use when checking for a successful response from a target. If the protocol version is gRPC, these are gRPC codes. Otherwise, these are HTTP codes. </p>\"\
    },\
    \"Max\":{\"type\":\"string\"},\
    \"MitigationInEffectEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"yes\",\
        \"no\"\
      ]\
    },\
    \"Mode\":{\"type\":\"string\"},\
    \"ModifyListenerInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ListenerArn\"],\
      \"members\":{\
        \"ListenerArn\":{\
          \"shape\":\"ListenerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the listener.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The port for connections from clients to the load balancer. You cannot specify a port for a Gateway Load Balancer.</p>\"\
        },\
        \"Protocol\":{\
          \"shape\":\"ProtocolEnum\",\
          \"documentation\":\"<p>The protocol for connections from clients to the load balancer. Application Load Balancers support the HTTP and HTTPS protocols. Network Load Balancers support the TCP, TLS, UDP, and TCP_UDP protocols. You canât change the protocol to UDP or TCP_UDP if dual-stack mode is enabled. You cannot specify a protocol for a Gateway Load Balancer.</p>\"\
        },\
        \"SslPolicy\":{\
          \"shape\":\"SslPolicyName\",\
          \"documentation\":\"<p>[HTTPS and TLS listeners] The security policy that defines which protocols and ciphers are supported.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies\\\">Security policies</a> in the <i>Application Load Balancers Guide</i> or <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#describe-ssl-policies\\\">Security policies</a> in the <i>Network Load Balancers Guide</i>.</p>\"\
        },\
        \"Certificates\":{\
          \"shape\":\"CertificateList\",\
          \"documentation\":\"<p>[HTTPS and TLS listeners] The default certificate for the listener. You must provide exactly one certificate. Set <code>CertificateArn</code> to the certificate ARN but do not set <code>IsDefault</code>.</p>\"\
        },\
        \"DefaultActions\":{\
          \"shape\":\"Actions\",\
          \"documentation\":\"<p>The actions for the default rule.</p>\"\
        },\
        \"AlpnPolicy\":{\
          \"shape\":\"AlpnPolicyName\",\
          \"documentation\":\"<p>[TLS listeners] The name of the Application-Layer Protocol Negotiation (ALPN) policy. You can specify one policy name. The following are the possible values:</p> <ul> <li> <p> <code>HTTP1Only</code> </p> </li> <li> <p> <code>HTTP2Only</code> </p> </li> <li> <p> <code>HTTP2Optional</code> </p> </li> <li> <p> <code>HTTP2Preferred</code> </p> </li> <li> <p> <code>None</code> </p> </li> </ul> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#alpn-policies\\\">ALPN policies</a> in the <i>Network Load Balancers Guide</i>.</p>\"\
        },\
        \"MutualAuthentication\":{\
          \"shape\":\"MutualAuthenticationAttributes\",\
          \"documentation\":\"<p>The mutual authentication configuration information.</p>\"\
        }\
      }\
    },\
    \"ModifyListenerOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Listeners\":{\
          \"shape\":\"Listeners\",\
          \"documentation\":\"<p>Information about the modified listener.</p>\"\
        }\
      }\
    },\
    \"ModifyLoadBalancerAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerArn\",\
        \"Attributes\"\
      ],\
      \"members\":{\
        \"LoadBalancerArn\":{\
          \"shape\":\"LoadBalancerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the load balancer.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"LoadBalancerAttributes\",\
          \"documentation\":\"<p>The load balancer attributes.</p>\"\
        }\
      }\
    },\
    \"ModifyLoadBalancerAttributesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attributes\":{\
          \"shape\":\"LoadBalancerAttributes\",\
          \"documentation\":\"<p>Information about the load balancer attributes.</p>\"\
        }\
      }\
    },\
    \"ModifyRuleInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"RuleArn\"],\
      \"members\":{\
        \"RuleArn\":{\
          \"shape\":\"RuleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the rule.</p>\"\
        },\
        \"Conditions\":{\
          \"shape\":\"RuleConditionList\",\
          \"documentation\":\"<p>The conditions.</p>\"\
        },\
        \"Actions\":{\
          \"shape\":\"Actions\",\
          \"documentation\":\"<p>The actions.</p>\"\
        }\
      }\
    },\
    \"ModifyRuleOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Rules\":{\
          \"shape\":\"Rules\",\
          \"documentation\":\"<p>Information about the modified rule.</p>\"\
        }\
      }\
    },\
    \"ModifyTargetGroupAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TargetGroupArn\",\
        \"Attributes\"\
      ],\
      \"members\":{\
        \"TargetGroupArn\":{\
          \"shape\":\"TargetGroupArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the target group.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"TargetGroupAttributes\",\
          \"documentation\":\"<p>The attributes.</p>\"\
        }\
      }\
    },\
    \"ModifyTargetGroupAttributesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attributes\":{\
          \"shape\":\"TargetGroupAttributes\",\
          \"documentation\":\"<p>Information about the attributes.</p>\"\
        }\
      }\
    },\
    \"ModifyTargetGroupInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TargetGroupArn\"],\
      \"members\":{\
        \"TargetGroupArn\":{\
          \"shape\":\"TargetGroupArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the target group.</p>\"\
        },\
        \"HealthCheckProtocol\":{\
          \"shape\":\"ProtocolEnum\",\
          \"documentation\":\"<p>The protocol the load balancer uses when performing health checks on targets. For Application Load Balancers, the default is HTTP. For Network Load Balancers and Gateway Load Balancers, the default is TCP. The TCP protocol is not supported for health checks if the protocol of the target group is HTTP or HTTPS. It is supported for health checks only if the protocol of the target group is TCP, TLS, UDP, or TCP_UDP. The GENEVE, TLS, UDP, and TCP_UDP protocols are not supported for health checks.</p>\"\
        },\
        \"HealthCheckPort\":{\
          \"shape\":\"HealthCheckPort\",\
          \"documentation\":\"<p>The port the load balancer uses when performing health checks on targets.</p>\"\
        },\
        \"HealthCheckPath\":{\
          \"shape\":\"Path\",\
          \"documentation\":\"<p>[HTTP/HTTPS health checks] The destination for health checks on the targets.</p> <p>[HTTP1 or HTTP2 protocol version] The ping path. The default is /.</p> <p>[GRPC protocol version] The path of a custom health check method with the format /package.service/method. The default is /Amazon Web Services.ALB/healthcheck.</p>\"\
        },\
        \"HealthCheckEnabled\":{\
          \"shape\":\"HealthCheckEnabled\",\
          \"documentation\":\"<p>Indicates whether health checks are enabled.</p>\"\
        },\
        \"HealthCheckIntervalSeconds\":{\
          \"shape\":\"HealthCheckIntervalSeconds\",\
          \"documentation\":\"<p>The approximate amount of time, in seconds, between health checks of an individual target.</p>\"\
        },\
        \"HealthCheckTimeoutSeconds\":{\
          \"shape\":\"HealthCheckTimeoutSeconds\",\
          \"documentation\":\"<p>[HTTP/HTTPS health checks] The amount of time, in seconds, during which no response means a failed health check.</p>\"\
        },\
        \"HealthyThresholdCount\":{\
          \"shape\":\"HealthCheckThresholdCount\",\
          \"documentation\":\"<p>The number of consecutive health checks successes required before considering an unhealthy target healthy.</p>\"\
        },\
        \"UnhealthyThresholdCount\":{\
          \"shape\":\"HealthCheckThresholdCount\",\
          \"documentation\":\"<p>The number of consecutive health check failures required before considering the target unhealthy.</p>\"\
        },\
        \"Matcher\":{\
          \"shape\":\"Matcher\",\
          \"documentation\":\"<p>[HTTP/HTTPS health checks] The HTTP or gRPC codes to use when checking for a successful response from a target. For target groups with a protocol of TCP, TCP_UDP, UDP or TLS the range is 200-599. For target groups with a protocol of HTTP or HTTPS, the range is 200-499. For target groups with a protocol of GENEVE, the range is 200-399.</p>\"\
        }\
      }\
    },\
    \"ModifyTargetGroupOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TargetGroups\":{\
          \"shape\":\"TargetGroups\",\
          \"documentation\":\"<p>Information about the modified target group.</p>\"\
        }\
      }\
    },\
    \"ModifyTrustStoreInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrustStoreArn\",\
        \"CaCertificatesBundleS3Bucket\",\
        \"CaCertificatesBundleS3Key\"\
      ],\
      \"members\":{\
        \"TrustStoreArn\":{\
          \"shape\":\"TrustStoreArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trust store.</p>\"\
        },\
        \"CaCertificatesBundleS3Bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>The Amazon S3 bucket for the ca certificates bundle.</p>\"\
        },\
        \"CaCertificatesBundleS3Key\":{\
          \"shape\":\"S3Key\",\
          \"documentation\":\"<p>The Amazon S3 path for the ca certificates bundle.</p>\"\
        },\
        \"CaCertificatesBundleS3ObjectVersion\":{\
          \"shape\":\"S3ObjectVersion\",\
          \"documentation\":\"<p>The Amazon S3 object version for the ca certificates bundle. If undefined the current version is used.</p>\"\
        }\
      }\
    },\
    \"ModifyTrustStoreOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrustStores\":{\
          \"shape\":\"TrustStores\",\
          \"documentation\":\"<p>Information about the modified trust store.</p>\"\
        }\
      }\
    },\
    \"MutualAuthenticationAttributes\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Mode\":{\
          \"shape\":\"Mode\",\
          \"documentation\":\"<p>The client certificate handling method. Options are <code>off</code>, <code>passthrough</code> or <code>verify</code>. The default value is <code>off</code>.</p>\"\
        },\
        \"TrustStoreArn\":{\
          \"shape\":\"TrustStoreArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trust store.</p>\"\
        },\
        \"IgnoreClientCertificateExpiry\":{\
          \"shape\":\"IgnoreClientCertificateExpiry\",\
          \"documentation\":\"<p>Indicates whether expired client certificates are ignored.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the mutual authentication attributes of a listener.</p>\"\
    },\
    \"Name\":{\"type\":\"string\"},\
    \"NumberOfCaCertificates\":{\"type\":\"integer\"},\
    \"NumberOfRevokedEntries\":{\"type\":\"long\"},\
    \"OperationNotPermittedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>This operation is not allowed.</p>\",\
      \"error\":{\
        \"code\":\"OperationNotPermitted\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"OutpostId\":{\"type\":\"string\"},\
    \"PageSize\":{\
      \"type\":\"integer\",\
      \"max\":400,\
      \"min\":1\
    },\
    \"Path\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"PathPatternConditionConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Values\":{\
          \"shape\":\"ListOfString\",\
          \"documentation\":\"<p>The path patterns to compare against the request URL. The maximum size of each string is 128 characters. The comparison is case sensitive. The following wildcard characters are supported: * (matches 0 or more characters) and ? (matches exactly 1 character).</p> <p>If you specify multiple strings, the condition is satisfied if one of them matches the request URL. The path pattern is compared only to the path of the URL, not to its query string. To compare against the query string, use <a>QueryStringConditionConfig</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a path pattern condition.</p>\"\
    },\
    \"Port\":{\
      \"type\":\"integer\",\
      \"max\":65535,\
      \"min\":1\
    },\
    \"PriorityInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified priority is in use.</p>\",\
      \"error\":{\
        \"code\":\"PriorityInUse\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"PrivateIPv4Address\":{\"type\":\"string\"},\
    \"ProtocolEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"HTTP\",\
        \"HTTPS\",\
        \"TCP\",\
        \"TLS\",\
        \"UDP\",\
        \"TCP_UDP\",\
        \"GENEVE\"\
      ]\
    },\
    \"ProtocolVersion\":{\"type\":\"string\"},\
    \"QueryStringConditionConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Values\":{\
          \"shape\":\"QueryStringKeyValuePairList\",\
          \"documentation\":\"<p>The key/value pairs or values to find in the query string. The maximum size of each string is 128 characters. The comparison is case insensitive. The following wildcard characters are supported: * (matches 0 or more characters) and ? (matches exactly 1 character). To search for a literal '*' or '?' character in a query string, you must escape these characters in <code>Values</code> using a '\\\\' character.</p> <p>If you specify multiple key/value pairs or values, the condition is satisfied if one of them is found in the query string.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a query string condition.</p> <p>The query string component of a URI starts after the first '?' character and is terminated by either a '#' character or the end of the URI. A typical query string contains key/value pairs separated by '&amp;' characters. The allowed characters are specified by RFC 3986. Any character can be percentage encoded.</p>\"\
    },\
    \"QueryStringKeyValuePair\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"StringValue\",\
          \"documentation\":\"<p>The key. You can omit the key.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"StringValue\",\
          \"documentation\":\"<p>The value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a key/value pair.</p>\"\
    },\
    \"QueryStringKeyValuePairList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QueryStringKeyValuePair\"}\
    },\
    \"RedirectActionConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"StatusCode\"],\
      \"members\":{\
        \"Protocol\":{\
          \"shape\":\"RedirectActionProtocol\",\
          \"documentation\":\"<p>The protocol. You can specify HTTP, HTTPS, or #{protocol}. You can redirect HTTP to HTTP, HTTP to HTTPS, and HTTPS to HTTPS. You cannot redirect HTTPS to HTTP.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"RedirectActionPort\",\
          \"documentation\":\"<p>The port. You can specify a value from 1 to 65535 or #{port}.</p>\"\
        },\
        \"Host\":{\
          \"shape\":\"RedirectActionHost\",\
          \"documentation\":\"<p>The hostname. This component is not percent-encoded. The hostname can contain #{host}.</p>\"\
        },\
        \"Path\":{\
          \"shape\":\"RedirectActionPath\",\
          \"documentation\":\"<p>The absolute path, starting with the leading \\\"/\\\". This component is not percent-encoded. The path can contain #{host}, #{path}, and #{port}.</p>\"\
        },\
        \"Query\":{\
          \"shape\":\"RedirectActionQuery\",\
          \"documentation\":\"<p>The query parameters, URL-encoded when necessary, but not percent-encoded. Do not include the leading \\\"?\\\", as it is automatically added. You can specify any of the reserved keywords.</p>\"\
        },\
        \"StatusCode\":{\
          \"shape\":\"RedirectActionStatusCodeEnum\",\
          \"documentation\":\"<p>The HTTP redirect code. The redirect is either permanent (HTTP 301) or temporary (HTTP 302).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a redirect action.</p> <p>A URI consists of the following components: protocol://hostname:port/path?query. You must modify at least one of the following components to avoid a redirect loop: protocol, hostname, port, or path. Any components that you do not modify retain their original values.</p> <p>You can reuse URI components using the following reserved keywords:</p> <ul> <li> <p>#{protocol}</p> </li> <li> <p>#{host}</p> </li> <li> <p>#{port}</p> </li> <li> <p>#{path} (the leading \\\"/\\\" is removed)</p> </li> <li> <p>#{query}</p> </li> </ul> <p>For example, you can change the path to \\\"/new/#{path}\\\", the hostname to \\\"example.#{host}\\\", or the query to \\\"#{query}&amp;value=xyz\\\".</p>\"\
    },\
    \"RedirectActionHost\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"RedirectActionPath\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"RedirectActionPort\":{\"type\":\"string\"},\
    \"RedirectActionProtocol\":{\
      \"type\":\"string\",\
      \"pattern\":\"^(HTTPS?|#\\\\{protocol\\\\})$\"\
    },\
    \"RedirectActionQuery\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":0\
    },\
    \"RedirectActionStatusCodeEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"HTTP_301\",\
        \"HTTP_302\"\
      ]\
    },\
    \"RegisterTargetsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TargetGroupArn\",\
        \"Targets\"\
      ],\
      \"members\":{\
        \"TargetGroupArn\":{\
          \"shape\":\"TargetGroupArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the target group.</p>\"\
        },\
        \"Targets\":{\
          \"shape\":\"TargetDescriptions\",\
          \"documentation\":\"<p>The targets.</p>\"\
        }\
      }\
    },\
    \"RegisterTargetsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"RemoveListenerCertificatesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ListenerArn\",\
        \"Certificates\"\
      ],\
      \"members\":{\
        \"ListenerArn\":{\
          \"shape\":\"ListenerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the listener.</p>\"\
        },\
        \"Certificates\":{\
          \"shape\":\"CertificateList\",\
          \"documentation\":\"<p>The certificate to remove. You can specify one certificate per call. Set <code>CertificateArn</code> to the certificate ARN but do not set <code>IsDefault</code>.</p>\"\
        }\
      }\
    },\
    \"RemoveListenerCertificatesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"RemoveTagsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArns\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceArns\":{\
          \"shape\":\"ResourceArns\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeys\",\
          \"documentation\":\"<p>The tag keys for the tags to remove.</p>\"\
        }\
      }\
    },\
    \"RemoveTagsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"RemoveTrustStoreRevocationsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrustStoreArn\",\
        \"RevocationIds\"\
      ],\
      \"members\":{\
        \"TrustStoreArn\":{\
          \"shape\":\"TrustStoreArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trust store.</p>\"\
        },\
        \"RevocationIds\":{\
          \"shape\":\"RevocationIds\",\
          \"documentation\":\"<p>The revocation IDs of the revocation files you want to remove.</p>\"\
        }\
      }\
    },\
    \"RemoveTrustStoreRevocationsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"ResourceArn\":{\"type\":\"string\"},\
    \"ResourceArns\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceArn\"}\
    },\
    \"ResourceInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A specified resource is in use.</p>\",\
      \"error\":{\
        \"code\":\"ResourceInUse\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"RevocationContent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>The Amazon S3 bucket for the revocation file.</p>\"\
        },\
        \"S3Key\":{\
          \"shape\":\"S3Key\",\
          \"documentation\":\"<p>The Amazon S3 path for the revocation file.</p>\"\
        },\
        \"S3ObjectVersion\":{\
          \"shape\":\"S3ObjectVersion\",\
          \"documentation\":\"<p>The Amazon S3 object version of the revocation file.</p>\"\
        },\
        \"RevocationType\":{\
          \"shape\":\"RevocationType\",\
          \"documentation\":\"<p>The type of revocation file.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a revocation file.</p>\"\
    },\
    \"RevocationContentNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified revocation file does not exist.</p>\",\
      \"error\":{\
        \"code\":\"RevocationContentNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"RevocationContents\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RevocationContent\"}\
    },\
    \"RevocationId\":{\"type\":\"long\"},\
    \"RevocationIdNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified revocation ID does not exist.</p>\",\
      \"error\":{\
        \"code\":\"RevocationIdNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"RevocationIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RevocationId\"}\
    },\
    \"RevocationType\":{\
      \"type\":\"string\",\
      \"enum\":[\"CRL\"]\
    },\
    \"Rule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RuleArn\":{\
          \"shape\":\"RuleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the rule.</p>\"\
        },\
        \"Priority\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The priority.</p>\"\
        },\
        \"Conditions\":{\
          \"shape\":\"RuleConditionList\",\
          \"documentation\":\"<p>The conditions. Each rule can include zero or one of the following conditions: <code>http-request-method</code>, <code>host-header</code>, <code>path-pattern</code>, and <code>source-ip</code>, and zero or more of the following conditions: <code>http-header</code> and <code>query-string</code>.</p>\"\
        },\
        \"Actions\":{\
          \"shape\":\"Actions\",\
          \"documentation\":\"<p>The actions. Each rule must include exactly one of the following types of actions: <code>forward</code>, <code>redirect</code>, or <code>fixed-response</code>, and it must be the last action to be performed.</p>\"\
        },\
        \"IsDefault\":{\
          \"shape\":\"IsDefault\",\
          \"documentation\":\"<p>Indicates whether this is the default rule.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a rule.</p>\"\
    },\
    \"RuleArn\":{\"type\":\"string\"},\
    \"RuleArns\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RuleArn\"}\
    },\
    \"RuleCondition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Field\":{\
          \"shape\":\"ConditionFieldName\",\
          \"documentation\":\"<p>The field in the HTTP request. The following are the possible values:</p> <ul> <li> <p> <code>http-header</code> </p> </li> <li> <p> <code>http-request-method</code> </p> </li> <li> <p> <code>host-header</code> </p> </li> <li> <p> <code>path-pattern</code> </p> </li> <li> <p> <code>query-string</code> </p> </li> <li> <p> <code>source-ip</code> </p> </li> </ul>\"\
        },\
        \"Values\":{\
          \"shape\":\"ListOfString\",\
          \"documentation\":\"<p>The condition value. Specify only when <code>Field</code> is <code>host-header</code> or <code>path-pattern</code>. Alternatively, to specify multiple host names or multiple path patterns, use <code>HostHeaderConfig</code> or <code>PathPatternConfig</code>.</p> <p>If <code>Field</code> is <code>host-header</code> and you are not using <code>HostHeaderConfig</code>, you can specify a single host name (for example, my.example.com) in <code>Values</code>. A host name is case insensitive, can be up to 128 characters in length, and can contain any of the following characters.</p> <ul> <li> <p>A-Z, a-z, 0-9</p> </li> <li> <p>- .</p> </li> <li> <p>* (matches 0 or more characters)</p> </li> <li> <p>? (matches exactly 1 character)</p> </li> </ul> <p>If <code>Field</code> is <code>path-pattern</code> and you are not using <code>PathPatternConfig</code>, you can specify a single path pattern (for example, /img/*) in <code>Values</code>. A path pattern is case-sensitive, can be up to 128 characters in length, and can contain any of the following characters.</p> <ul> <li> <p>A-Z, a-z, 0-9</p> </li> <li> <p>_ - . $ / ~ \\\" ' @ : +</p> </li> <li> <p>&amp; (using &amp;amp;)</p> </li> <li> <p>* (matches 0 or more characters)</p> </li> <li> <p>? (matches exactly 1 character)</p> </li> </ul>\"\
        },\
        \"HostHeaderConfig\":{\
          \"shape\":\"HostHeaderConditionConfig\",\
          \"documentation\":\"<p>Information for a host header condition. Specify only when <code>Field</code> is <code>host-header</code>.</p>\"\
        },\
        \"PathPatternConfig\":{\
          \"shape\":\"PathPatternConditionConfig\",\
          \"documentation\":\"<p>Information for a path pattern condition. Specify only when <code>Field</code> is <code>path-pattern</code>.</p>\"\
        },\
        \"HttpHeaderConfig\":{\
          \"shape\":\"HttpHeaderConditionConfig\",\
          \"documentation\":\"<p>Information for an HTTP header condition. Specify only when <code>Field</code> is <code>http-header</code>.</p>\"\
        },\
        \"QueryStringConfig\":{\
          \"shape\":\"QueryStringConditionConfig\",\
          \"documentation\":\"<p>Information for a query string condition. Specify only when <code>Field</code> is <code>query-string</code>.</p>\"\
        },\
        \"HttpRequestMethodConfig\":{\
          \"shape\":\"HttpRequestMethodConditionConfig\",\
          \"documentation\":\"<p>Information for an HTTP method condition. Specify only when <code>Field</code> is <code>http-request-method</code>.</p>\"\
        },\
        \"SourceIpConfig\":{\
          \"shape\":\"SourceIpConditionConfig\",\
          \"documentation\":\"<p>Information for a source IP condition. Specify only when <code>Field</code> is <code>source-ip</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a condition for a rule.</p> <p>Each rule can optionally include up to one of each of the following conditions: <code>http-request-method</code>, <code>host-header</code>, <code>path-pattern</code>, and <code>source-ip</code>. Each rule can also optionally include one or more of each of the following conditions: <code>http-header</code> and <code>query-string</code>. Note that the value for a condition cannot be empty.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html\\\">Quotas for your Application Load Balancers</a>.</p>\"\
    },\
    \"RuleConditionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RuleCondition\"}\
    },\
    \"RuleNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified rule does not exist.</p>\",\
      \"error\":{\
        \"code\":\"RuleNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"RulePriority\":{\
      \"type\":\"integer\",\
      \"max\":50000,\
      \"min\":1\
    },\
    \"RulePriorityList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RulePriorityPair\"}\
    },\
    \"RulePriorityPair\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RuleArn\":{\
          \"shape\":\"RuleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the rule.</p>\"\
        },\
        \"Priority\":{\
          \"shape\":\"RulePriority\",\
          \"documentation\":\"<p>The rule priority.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the priorities for the rules for a listener.</p>\"\
    },\
    \"Rules\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Rule\"}\
    },\
    \"S3Bucket\":{\"type\":\"string\"},\
    \"S3Key\":{\"type\":\"string\"},\
    \"S3ObjectVersion\":{\"type\":\"string\"},\
    \"SSLPolicyNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified SSL policy does not exist.</p>\",\
      \"error\":{\
        \"code\":\"SSLPolicyNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"SecurityGroupId\":{\"type\":\"string\"},\
    \"SecurityGroups\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityGroupId\"}\
    },\
    \"SetIpAddressTypeInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerArn\",\
        \"IpAddressType\"\
      ],\
      \"members\":{\
        \"LoadBalancerArn\":{\
          \"shape\":\"LoadBalancerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the load balancer.</p>\"\
        },\
        \"IpAddressType\":{\
          \"shape\":\"IpAddressType\",\
          \"documentation\":\"<p>Note: Internal load balancers must use the <code>ipv4</code> IP address type.</p> <p>[Application Load Balancers] The IP address type. The possible values are <code>ipv4</code> (for only IPv4 addresses), <code>dualstack</code> (for IPv4 and IPv6 addresses), and <code>dualstack-without-public-ipv4</code> (for IPv6 only public addresses, with private IPv4 and IPv6 addresses).</p> <p>[Network Load Balancers] The IP address type. The possible values are <code>ipv4</code> (for only IPv4 addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses). You canât specify <code>dualstack</code> for a load balancer with a UDP or TCP_UDP listener.</p> <p>[Gateway Load Balancers] The IP address type. The possible values are <code>ipv4</code> (for only IPv4 addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses).</p>\"\
        }\
      }\
    },\
    \"SetIpAddressTypeOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IpAddressType\":{\
          \"shape\":\"IpAddressType\",\
          \"documentation\":\"<p>The IP address type.</p>\"\
        }\
      }\
    },\
    \"SetRulePrioritiesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"RulePriorities\"],\
      \"members\":{\
        \"RulePriorities\":{\
          \"shape\":\"RulePriorityList\",\
          \"documentation\":\"<p>The rule priorities.</p>\"\
        }\
      }\
    },\
    \"SetRulePrioritiesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Rules\":{\
          \"shape\":\"Rules\",\
          \"documentation\":\"<p>Information about the rules.</p>\"\
        }\
      }\
    },\
    \"SetSecurityGroupsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerArn\",\
        \"SecurityGroups\"\
      ],\
      \"members\":{\
        \"LoadBalancerArn\":{\
          \"shape\":\"LoadBalancerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the load balancer.</p>\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"SecurityGroups\",\
          \"documentation\":\"<p>The IDs of the security groups.</p>\"\
        },\
        \"EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic\":{\
          \"shape\":\"EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum\",\
          \"documentation\":\"<p>Indicates whether to evaluate inbound security group rules for traffic sent to a Network Load Balancer through Amazon Web Services PrivateLink. The default is <code>on</code>.</p>\"\
        }\
      }\
    },\
    \"SetSecurityGroupsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroups\",\
          \"documentation\":\"<p>The IDs of the security groups associated with the load balancer.</p>\"\
        },\
        \"EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic\":{\
          \"shape\":\"EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum\",\
          \"documentation\":\"<p>Indicates whether to evaluate inbound security group rules for traffic sent to a Network Load Balancer through Amazon Web Services PrivateLink.</p>\"\
        }\
      }\
    },\
    \"SetSubnetsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"LoadBalancerArn\"],\
      \"members\":{\
        \"LoadBalancerArn\":{\
          \"shape\":\"LoadBalancerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the load balancer.</p>\"\
        },\
        \"Subnets\":{\
          \"shape\":\"Subnets\",\
          \"documentation\":\"<p>The IDs of the public subnets. You can specify only one subnet per Availability Zone. You must specify either subnets or subnet mappings.</p> <p>[Application Load Balancers] You must specify subnets from at least two Availability Zones.</p> <p>[Application Load Balancers on Outposts] You must specify one Outpost subnet.</p> <p>[Application Load Balancers on Local Zones] You can specify subnets from one or more Local Zones.</p> <p>[Network Load Balancers] You can specify subnets from one or more Availability Zones.</p> <p>[Gateway Load Balancers] You can specify subnets from one or more Availability Zones.</p>\"\
        },\
        \"SubnetMappings\":{\
          \"shape\":\"SubnetMappings\",\
          \"documentation\":\"<p>The IDs of the public subnets. You can specify only one subnet per Availability Zone. You must specify either subnets or subnet mappings.</p> <p>[Application Load Balancers] You must specify subnets from at least two Availability Zones. You cannot specify Elastic IP addresses for your subnets.</p> <p>[Application Load Balancers on Outposts] You must specify one Outpost subnet.</p> <p>[Application Load Balancers on Local Zones] You can specify subnets from one or more Local Zones.</p> <p>[Network Load Balancers] You can specify subnets from one or more Availability Zones. You can specify one Elastic IP address per subnet if you need static IP addresses for your internet-facing load balancer. For internal load balancers, you can specify one private IP address per subnet from the IPv4 range of the subnet. For internet-facing load balancer, you can specify one IPv6 address per subnet.</p> <p>[Gateway Load Balancers] You can specify subnets from one or more Availability Zones.</p>\"\
        },\
        \"IpAddressType\":{\
          \"shape\":\"IpAddressType\",\
          \"documentation\":\"<p>[Application Load Balancers] The IP address type. The possible values are <code>ipv4</code> (for only IPv4 addresses), <code>dualstack</code> (for IPv4 and IPv6 addresses), and <code>dualstack-without-public-ipv4</code> (for IPv6 only public addresses, with private IPv4 and IPv6 addresses).</p> <p>[Network Load Balancers] The type of IP addresses used by the subnets for your load balancer. The possible values are <code>ipv4</code> (for IPv4 addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses). You canât specify <code>dualstack</code> for a load balancer with a UDP or TCP_UDP listener.</p> <p>[Gateway Load Balancers] The type of IP addresses used by the subnets for your load balancer. The possible values are <code>ipv4</code> (for IPv4 addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses).</p>\"\
        }\
      }\
    },\
    \"SetSubnetsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AvailabilityZones\":{\
          \"shape\":\"AvailabilityZones\",\
          \"documentation\":\"<p>Information about the subnets.</p>\"\
        },\
        \"IpAddressType\":{\
          \"shape\":\"IpAddressType\",\
          \"documentation\":\"<p>[Application Load Balancers] The IP address type.</p> <p>[Network Load Balancers] The IP address type.</p> <p>[Gateway Load Balancers] The IP address type.</p>\"\
        }\
      }\
    },\
    \"SourceIpConditionConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Values\":{\
          \"shape\":\"ListOfString\",\
          \"documentation\":\"<p>The source IP addresses, in CIDR format. You can use both IPv4 and IPv6 addresses. Wildcards are not supported.</p> <p>If you specify multiple addresses, the condition is satisfied if the source IP address of the request matches one of the CIDR blocks. This condition is not satisfied by the addresses in the X-Forwarded-For header. To search for addresses in the X-Forwarded-For header, use <a>HttpHeaderConditionConfig</a>.</p> <p>The total number of values must be less than, or equal to five.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a source IP condition.</p> <p>You can use this condition to route based on the IP address of the source that connects to the load balancer. If a client is behind a proxy, this is the IP address of the proxy not the IP address of the client.</p>\"\
    },\
    \"SslPolicies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SslPolicy\"}\
    },\
    \"SslPolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SslProtocols\":{\
          \"shape\":\"SslProtocols\",\
          \"documentation\":\"<p>The protocols.</p>\"\
        },\
        \"Ciphers\":{\
          \"shape\":\"Ciphers\",\
          \"documentation\":\"<p>The ciphers.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"SslPolicyName\",\
          \"documentation\":\"<p>The name of the policy.</p>\"\
        },\
        \"SupportedLoadBalancerTypes\":{\
          \"shape\":\"ListOfString\",\
          \"documentation\":\"<p> The supported load balancers. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a policy used for SSL negotiation.</p>\"\
    },\
    \"SslPolicyName\":{\"type\":\"string\"},\
    \"SslPolicyNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SslPolicyName\"}\
    },\
    \"SslProtocol\":{\"type\":\"string\"},\
    \"SslProtocols\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SslProtocol\"}\
    },\
    \"StateReason\":{\"type\":\"string\"},\
    \"String\":{\"type\":\"string\"},\
    \"StringValue\":{\"type\":\"string\"},\
    \"SubnetId\":{\"type\":\"string\"},\
    \"SubnetMapping\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubnetId\":{\
          \"shape\":\"SubnetId\",\
          \"documentation\":\"<p>The ID of the subnet.</p>\"\
        },\
        \"AllocationId\":{\
          \"shape\":\"AllocationId\",\
          \"documentation\":\"<p>[Network Load Balancers] The allocation ID of the Elastic IP address for an internet-facing load balancer.</p>\"\
        },\
        \"PrivateIPv4Address\":{\
          \"shape\":\"PrivateIPv4Address\",\
          \"documentation\":\"<p>[Network Load Balancers] The private IPv4 address for an internal load balancer.</p>\"\
        },\
        \"IPv6Address\":{\
          \"shape\":\"IPv6Address\",\
          \"documentation\":\"<p>[Network Load Balancers] The IPv6 address.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a subnet mapping.</p>\"\
    },\
    \"SubnetMappings\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubnetMapping\"}\
    },\
    \"SubnetNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified subnet does not exist.</p>\",\
      \"error\":{\
        \"code\":\"SubnetNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Subnets\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubnetId\"}\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\"Key\"],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The key of the tag.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The value of the tag.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a tag.</p>\"\
    },\
    \"TagDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Information about the tags.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The tags associated with a resource.</p>\"\
    },\
    \"TagDescriptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagDescription\"}\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"TagKeys\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"}\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"min\":1\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"TargetDescription\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TargetId\",\
          \"documentation\":\"<p>The ID of the target. If the target type of the target group is <code>instance</code>, specify an instance ID. If the target type is <code>ip</code>, specify an IP address. If the target type is <code>lambda</code>, specify the ARN of the Lambda function. If the target type is <code>alb</code>, specify the ARN of the Application Load Balancer target. </p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The port on which the target is listening. If the target group protocol is GENEVE, the supported port is 6081. If the target type is <code>alb</code>, the targeted Application Load Balancer must have at least one listener whose port matches the target group port. This parameter is not used if the target is a Lambda function.</p>\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"ZoneName\",\
          \"documentation\":\"<p>An Availability Zone or <code>all</code>. This determines whether the target receives traffic from the load balancer nodes in the specified Availability Zone or from all enabled Availability Zones for the load balancer.</p> <p>For Application Load Balancer target groups, the specified Availability Zone value is only applicable when cross-zone load balancing is off. Otherwise the parameter is ignored and treated as <code>all</code>.</p> <p>This parameter is not supported if the target type of the target group is <code>instance</code> or <code>alb</code>.</p> <p>If the target type is <code>ip</code> and the IP address is in a subnet of the VPC for the target group, the Availability Zone is automatically detected and this parameter is optional. If the IP address is outside the VPC, this parameter is required.</p> <p>For Application Load Balancer target groups with cross-zone load balancing off, if the target type is <code>ip</code> and the IP address is outside of the VPC for the target group, this should be an Availability Zone inside the VPC for the target group.</p> <p>If the target type is <code>lambda</code>, this parameter is optional and the only supported value is <code>all</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a target.</p>\"\
    },\
    \"TargetDescriptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TargetDescription\"}\
    },\
    \"TargetGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TargetGroupArn\":{\
          \"shape\":\"TargetGroupArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the target group.</p>\"\
        },\
        \"TargetGroupName\":{\
          \"shape\":\"TargetGroupName\",\
          \"documentation\":\"<p>The name of the target group.</p>\"\
        },\
        \"Protocol\":{\
          \"shape\":\"ProtocolEnum\",\
          \"documentation\":\"<p>The protocol to use for routing traffic to the targets.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The port on which the targets are listening. This parameter is not used if the target is a Lambda function.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"VpcId\",\
          \"documentation\":\"<p>The ID of the VPC for the targets.</p>\"\
        },\
        \"HealthCheckProtocol\":{\
          \"shape\":\"ProtocolEnum\",\
          \"documentation\":\"<p>The protocol to use to connect with the target. The GENEVE, TLS, UDP, and TCP_UDP protocols are not supported for health checks.</p>\"\
        },\
        \"HealthCheckPort\":{\
          \"shape\":\"HealthCheckPort\",\
          \"documentation\":\"<p>The port to use to connect with the target.</p>\"\
        },\
        \"HealthCheckEnabled\":{\
          \"shape\":\"HealthCheckEnabled\",\
          \"documentation\":\"<p>Indicates whether health checks are enabled.</p>\"\
        },\
        \"HealthCheckIntervalSeconds\":{\
          \"shape\":\"HealthCheckIntervalSeconds\",\
          \"documentation\":\"<p>The approximate amount of time, in seconds, between health checks of an individual target.</p>\"\
        },\
        \"HealthCheckTimeoutSeconds\":{\
          \"shape\":\"HealthCheckTimeoutSeconds\",\
          \"documentation\":\"<p>The amount of time, in seconds, during which no response means a failed health check.</p>\"\
        },\
        \"HealthyThresholdCount\":{\
          \"shape\":\"HealthCheckThresholdCount\",\
          \"documentation\":\"<p>The number of consecutive health checks successes required before considering an unhealthy target healthy.</p>\"\
        },\
        \"UnhealthyThresholdCount\":{\
          \"shape\":\"HealthCheckThresholdCount\",\
          \"documentation\":\"<p>The number of consecutive health check failures required before considering the target unhealthy.</p>\"\
        },\
        \"HealthCheckPath\":{\
          \"shape\":\"Path\",\
          \"documentation\":\"<p>The destination for health checks on the targets.</p>\"\
        },\
        \"Matcher\":{\
          \"shape\":\"Matcher\",\
          \"documentation\":\"<p>The HTTP or gRPC codes to use when checking for a successful response from a target.</p>\"\
        },\
        \"LoadBalancerArns\":{\
          \"shape\":\"LoadBalancerArns\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the load balancer that routes traffic to this target group. You can use each target group with only one load balancer.</p>\"\
        },\
        \"TargetType\":{\
          \"shape\":\"TargetTypeEnum\",\
          \"documentation\":\"<p>The type of target that you must specify when registering targets with this target group. The possible values are <code>instance</code> (register targets by instance ID), <code>ip</code> (register targets by IP address), <code>lambda</code> (register a single Lambda function as a target), or <code>alb</code> (register a single Application Load Balancer as a target).</p>\"\
        },\
        \"ProtocolVersion\":{\
          \"shape\":\"ProtocolVersion\",\
          \"documentation\":\"<p>[HTTP/HTTPS protocol] The protocol version. The possible values are <code>GRPC</code>, <code>HTTP1</code>, and <code>HTTP2</code>.</p>\"\
        },\
        \"IpAddressType\":{\
          \"shape\":\"TargetGroupIpAddressTypeEnum\",\
          \"documentation\":\"<p>The type of IP address used for this target group. The possible values are <code>ipv4</code> and <code>ipv6</code>. This is an optional parameter. If not specified, the IP address type defaults to <code>ipv4</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a target group.</p>\"\
    },\
    \"TargetGroupArn\":{\"type\":\"string\"},\
    \"TargetGroupArns\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TargetGroupArn\"}\
    },\
    \"TargetGroupAssociationLimitException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You've reached the limit on the number of load balancers per target group.</p>\",\
      \"error\":{\
        \"code\":\"TargetGroupAssociationLimit\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TargetGroupAttribute\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TargetGroupAttributeKey\",\
          \"documentation\":\"<p>The name of the attribute.</p> <p>The following attributes are supported by all load balancers:</p> <ul> <li> <p> <code>deregistration_delay.timeout_seconds</code> - The amount of time, in seconds, for Elastic Load Balancing to wait before changing the state of a deregistering target from <code>draining</code> to <code>unused</code>. The range is 0-3600 seconds. The default value is 300 seconds. If the target is a Lambda function, this attribute is not supported.</p> </li> <li> <p> <code>stickiness.enabled</code> - Indicates whether target stickiness is enabled. The value is <code>true</code> or <code>false</code>. The default is <code>false</code>.</p> </li> <li> <p> <code>stickiness.type</code> - Indicates the type of stickiness. The possible values are:</p> <ul> <li> <p> <code>lb_cookie</code> and <code>app_cookie</code> for Application Load Balancers.</p> </li> <li> <p> <code>source_ip</code> for Network Load Balancers.</p> </li> <li> <p> <code>source_ip_dest_ip</code> and <code>source_ip_dest_ip_proto</code> for Gateway Load Balancers.</p> </li> </ul> </li> </ul> <p>The following attributes are supported by Application Load Balancers and Network Load Balancers:</p> <ul> <li> <p> <code>load_balancing.cross_zone.enabled</code> - Indicates whether cross zone load balancing is enabled. The value is <code>true</code>, <code>false</code> or <code>use_load_balancer_configuration</code>. The default is <code>use_load_balancer_configuration</code>.</p> </li> <li> <p> <code>target_group_health.dns_failover.minimum_healthy_targets.count</code> - The minimum number of targets that must be healthy. If the number of healthy targets is below this value, mark the zone as unhealthy in DNS, so that traffic is routed only to healthy zones. The possible values are <code>off</code> or an integer from 1 to the maximum number of targets. The default is <code>off</code>.</p> </li> <li> <p> <code>target_group_health.dns_failover.minimum_healthy_targets.percentage</code> - The minimum percentage of targets that must be healthy. If the percentage of healthy targets is below this value, mark the zone as unhealthy in DNS, so that traffic is routed only to healthy zones. The possible values are <code>off</code> or an integer from 1 to 100. The default is <code>off</code>.</p> </li> <li> <p> <code>target_group_health.unhealthy_state_routing.minimum_healthy_targets.count</code> - The minimum number of targets that must be healthy. If the number of healthy targets is below this value, send traffic to all targets, including unhealthy targets. The possible values are 1 to the maximum number of targets. The default is 1.</p> </li> <li> <p> <code>target_group_health.unhealthy_state_routing.minimum_healthy_targets.percentage</code> - The minimum percentage of targets that must be healthy. If the percentage of healthy targets is below this value, send traffic to all targets, including unhealthy targets. The possible values are <code>off</code> or an integer from 1 to 100. The default is <code>off</code>.</p> </li> </ul> <p>The following attributes are supported only if the load balancer is an Application Load Balancer and the target is an instance or an IP address:</p> <ul> <li> <p> <code>load_balancing.algorithm.type</code> - The load balancing algorithm determines how the load balancer selects targets when routing requests. The value is <code>round_robin</code>, <code>least_outstanding_requests</code>, or <code>weighted_random</code>. The default is <code>round_robin</code>.</p> </li> <li> <p> <code>load_balancing.algorithm.anomaly_mitigation</code> - Only available when <code>load_balancing.algorithm.type</code> is <code>weighted_random</code>. Indicates whether anomaly mitigation is enabled. The value is <code>on</code> or <code>off</code>. The default is <code>off</code>.</p> </li> <li> <p> <code>slow_start.duration_seconds</code> - The time period, in seconds, during which a newly registered target receives an increasing share of the traffic to the target group. After this time period ends, the target receives its full share of traffic. The range is 30-900 seconds (15 minutes). The default is 0 seconds (disabled).</p> </li> <li> <p> <code>stickiness.app_cookie.cookie_name</code> - Indicates the name of the application-based cookie. Names that start with the following prefixes are not allowed: <code>AWSALB</code>, <code>AWSALBAPP</code>, and <code>AWSALBTG</code>; they're reserved for use by the load balancer.</p> </li> <li> <p> <code>stickiness.app_cookie.duration_seconds</code> - The time period, in seconds, during which requests from a client should be routed to the same target. After this time period expires, the application-based cookie is considered stale. The range is 1 second to 1 week (604800 seconds). The default value is 1 day (86400 seconds).</p> </li> <li> <p> <code>stickiness.lb_cookie.duration_seconds</code> - The time period, in seconds, during which requests from a client should be routed to the same target. After this time period expires, the load balancer-generated cookie is considered stale. The range is 1 second to 1 week (604800 seconds). The default value is 1 day (86400 seconds). </p> </li> </ul> <p>The following attribute is supported only if the load balancer is an Application Load Balancer and the target is a Lambda function:</p> <ul> <li> <p> <code>lambda.multi_value_headers.enabled</code> - Indicates whether the request and response headers that are exchanged between the load balancer and the Lambda function include arrays of values or strings. The value is <code>true</code> or <code>false</code>. The default is <code>false</code>. If the value is <code>false</code> and the request contains a duplicate header field name or query parameter key, the load balancer uses the last value sent by the client.</p> </li> </ul> <p>The following attributes are supported only by Network Load Balancers:</p> <ul> <li> <p> <code>deregistration_delay.connection_termination.enabled</code> - Indicates whether the load balancer terminates connections at the end of the deregistration timeout. The value is <code>true</code> or <code>false</code>. For new UDP/TCP_UDP target groups the default is <code>true</code>. Otherwise, the default is <code>false</code>.</p> </li> <li> <p> <code>preserve_client_ip.enabled</code> - Indicates whether client IP preservation is enabled. The value is <code>true</code> or <code>false</code>. The default is disabled if the target group type is IP address and the target group protocol is TCP or TLS. Otherwise, the default is enabled. Client IP preservation cannot be disabled for UDP and TCP_UDP target groups.</p> </li> <li> <p> <code>proxy_protocol_v2.enabled</code> - Indicates whether Proxy Protocol version 2 is enabled. The value is <code>true</code> or <code>false</code>. The default is <code>false</code>. </p> </li> <li> <p> <code>target_health_state.unhealthy.connection_termination.enabled</code> - Indicates whether the load balancer terminates connections to unhealthy targets. The value is <code>true</code> or <code>false</code>. The default is <code>true</code>.</p> </li> <li> <p> <code>target_health_state.unhealthy.draining_interval_seconds</code> - The amount of time for Elastic Load Balancing to wait before changing the state of an unhealthy target from <code>unhealthy.draining</code> to <code>unhealthy</code>. The range is 0-360000 seconds. The default value is 0 seconds.</p> <p>Note: This attribute can only be configured when <code>target_health_state.unhealthy.connection_termination.enabled</code> is <code>false</code>.</p> </li> </ul> <p>The following attributes are supported only by Gateway Load Balancers:</p> <ul> <li> <p> <code>target_failover.on_deregistration</code> - Indicates how the Gateway Load Balancer handles existing flows when a target is deregistered. The possible values are <code>rebalance</code> and <code>no_rebalance</code>. The default is <code>no_rebalance</code>. The two attributes (<code>target_failover.on_deregistration</code> and <code>target_failover.on_unhealthy</code>) can't be set independently. The value you set for both attributes must be the same. </p> </li> <li> <p> <code>target_failover.on_unhealthy</code> - Indicates how the Gateway Load Balancer handles existing flows when a target is unhealthy. The possible values are <code>rebalance</code> and <code>no_rebalance</code>. The default is <code>no_rebalance</code>. The two attributes (<code>target_failover.on_deregistration</code> and <code>target_failover.on_unhealthy</code>) cannot be set independently. The value you set for both attributes must be the same. </p> </li> </ul>\"\
        },\
        \"Value\":{\
          \"shape\":\"TargetGroupAttributeValue\",\
          \"documentation\":\"<p>The value of the attribute.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a target group attribute.</p>\"\
    },\
    \"TargetGroupAttributeKey\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"^[a-zA-Z0-9._]+$\"\
    },\
    \"TargetGroupAttributeValue\":{\"type\":\"string\"},\
    \"TargetGroupAttributes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TargetGroupAttribute\"}\
    },\
    \"TargetGroupIpAddressTypeEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ipv4\",\
        \"ipv6\"\
      ]\
    },\
    \"TargetGroupList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TargetGroupTuple\"}\
    },\
    \"TargetGroupName\":{\"type\":\"string\"},\
    \"TargetGroupNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TargetGroupName\"}\
    },\
    \"TargetGroupNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified target group does not exist.</p>\",\
      \"error\":{\
        \"code\":\"TargetGroupNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TargetGroupStickinessConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"TargetGroupStickinessEnabled\",\
          \"documentation\":\"<p>Indicates whether target group stickiness is enabled.</p>\"\
        },\
        \"DurationSeconds\":{\
          \"shape\":\"TargetGroupStickinessDurationSeconds\",\
          \"documentation\":\"<p>The time period, in seconds, during which requests from a client should be routed to the same target group. The range is 1-604800 seconds (7 days).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the target group stickiness for a rule.</p>\"\
    },\
    \"TargetGroupStickinessDurationSeconds\":{\"type\":\"integer\"},\
    \"TargetGroupStickinessEnabled\":{\"type\":\"boolean\"},\
    \"TargetGroupTuple\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TargetGroupArn\":{\
          \"shape\":\"TargetGroupArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the target group.</p>\"\
        },\
        \"Weight\":{\
          \"shape\":\"TargetGroupWeight\",\
          \"documentation\":\"<p>The weight. The range is 0 to 999.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about how traffic will be distributed between multiple target groups in a forward rule.</p>\"\
    },\
    \"TargetGroupWeight\":{\"type\":\"integer\"},\
    \"TargetGroups\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TargetGroup\"}\
    },\
    \"TargetHealth\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"State\":{\
          \"shape\":\"TargetHealthStateEnum\",\
          \"documentation\":\"<p>The state of the target.</p>\"\
        },\
        \"Reason\":{\
          \"shape\":\"TargetHealthReasonEnum\",\
          \"documentation\":\"<p>The reason code.</p> <p>If the target state is <code>healthy</code>, a reason code is not provided.</p> <p>If the target state is <code>initial</code>, the reason code can be one of the following values:</p> <ul> <li> <p> <code>Elb.RegistrationInProgress</code> - The target is in the process of being registered with the load balancer.</p> </li> <li> <p> <code>Elb.InitialHealthChecking</code> - The load balancer is still sending the target the minimum number of health checks required to determine its health status.</p> </li> </ul> <p>If the target state is <code>unhealthy</code>, the reason code can be one of the following values:</p> <ul> <li> <p> <code>Target.ResponseCodeMismatch</code> - The health checks did not return an expected HTTP code. Applies only to Application Load Balancers and Gateway Load Balancers.</p> </li> <li> <p> <code>Target.Timeout</code> - The health check requests timed out. Applies only to Application Load Balancers and Gateway Load Balancers.</p> </li> <li> <p> <code>Target.FailedHealthChecks</code> - The load balancer received an error while establishing a connection to the target or the target response was malformed.</p> </li> <li> <p> <code>Elb.InternalError</code> - The health checks failed due to an internal error. Applies only to Application Load Balancers.</p> </li> </ul> <p>If the target state is <code>unused</code>, the reason code can be one of the following values:</p> <ul> <li> <p> <code>Target.NotRegistered</code> - The target is not registered with the target group.</p> </li> <li> <p> <code>Target.NotInUse</code> - The target group is not used by any load balancer or the target is in an Availability Zone that is not enabled for its load balancer.</p> </li> <li> <p> <code>Target.InvalidState</code> - The target is in the stopped or terminated state.</p> </li> <li> <p> <code>Target.IpUnusable</code> - The target IP address is reserved for use by a load balancer.</p> </li> </ul> <p>If the target state is <code>draining</code>, the reason code can be the following value:</p> <ul> <li> <p> <code>Target.DeregistrationInProgress</code> - The target is in the process of being deregistered and the deregistration delay period has not expired.</p> </li> </ul> <p>If the target state is <code>unavailable</code>, the reason code can be the following value:</p> <ul> <li> <p> <code>Target.HealthCheckDisabled</code> - Health checks are disabled for the target group. Applies only to Application Load Balancers.</p> </li> <li> <p> <code>Elb.InternalError</code> - Target health is unavailable due to an internal error. Applies only to Network Load Balancers.</p> </li> </ul>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the target health that provides additional details. If the state is <code>healthy</code>, a description is not provided.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the current health of a target.</p>\"\
    },\
    \"TargetHealthDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Target\":{\
          \"shape\":\"TargetDescription\",\
          \"documentation\":\"<p>The description of the target.</p>\"\
        },\
        \"HealthCheckPort\":{\
          \"shape\":\"HealthCheckPort\",\
          \"documentation\":\"<p>The port to use to connect with the target.</p>\"\
        },\
        \"TargetHealth\":{\
          \"shape\":\"TargetHealth\",\
          \"documentation\":\"<p>The health information for the target.</p>\"\
        },\
        \"AnomalyDetection\":{\
          \"shape\":\"AnomalyDetection\",\
          \"documentation\":\"<p>The anomaly detection result for the target.</p> <p>If no anomalies were detected, the result is <code>normal</code>.</p> <p>If anomalies were detected, the result is <code>anomalous</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the health of a target.</p>\"\
    },\
    \"TargetHealthDescriptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TargetHealthDescription\"}\
    },\
    \"TargetHealthReasonEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Elb.RegistrationInProgress\",\
        \"Elb.InitialHealthChecking\",\
        \"Target.ResponseCodeMismatch\",\
        \"Target.Timeout\",\
        \"Target.FailedHealthChecks\",\
        \"Target.NotRegistered\",\
        \"Target.NotInUse\",\
        \"Target.DeregistrationInProgress\",\
        \"Target.InvalidState\",\
        \"Target.IpUnusable\",\
        \"Target.HealthCheckDisabled\",\
        \"Elb.InternalError\"\
      ]\
    },\
    \"TargetHealthStateEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"initial\",\
        \"healthy\",\
        \"unhealthy\",\
        \"unhealthy.draining\",\
        \"unused\",\
        \"draining\",\
        \"unavailable\"\
      ]\
    },\
    \"TargetId\":{\"type\":\"string\"},\
    \"TargetTypeEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"instance\",\
        \"ip\",\
        \"lambda\",\
        \"alb\"\
      ]\
    },\
    \"TooManyActionsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You've reached the limit on the number of actions per rule.</p>\",\
      \"error\":{\
        \"code\":\"TooManyActions\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TooManyCertificatesException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You've reached the limit on the number of certificates per load balancer.</p>\",\
      \"error\":{\
        \"code\":\"TooManyCertificates\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TooManyListenersException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You've reached the limit on the number of listeners per load balancer.</p>\",\
      \"error\":{\
        \"code\":\"TooManyListeners\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TooManyLoadBalancersException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You've reached the limit on the number of load balancers for your Amazon Web Services account.</p>\",\
      \"error\":{\
        \"code\":\"TooManyLoadBalancers\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TooManyRegistrationsForTargetIdException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You've reached the limit on the number of times a target can be registered with a load balancer.</p>\",\
      \"error\":{\
        \"code\":\"TooManyRegistrationsForTargetId\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TooManyRulesException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You've reached the limit on the number of rules per load balancer.</p>\",\
      \"error\":{\
        \"code\":\"TooManyRules\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TooManyTagsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You've reached the limit on the number of tags for this resource.</p>\",\
      \"error\":{\
        \"code\":\"TooManyTags\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TooManyTargetGroupsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You've reached the limit on the number of target groups for your Amazon Web Services account.</p>\",\
      \"error\":{\
        \"code\":\"TooManyTargetGroups\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TooManyTargetsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You've reached the limit on the number of targets.</p>\",\
      \"error\":{\
        \"code\":\"TooManyTargets\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TooManyTrustStoreRevocationEntriesException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified trust store has too many revocation entries.</p>\",\
      \"error\":{\
        \"code\":\"TooManyTrustStoreRevocationEntries\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TooManyTrustStoresException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You've reached the limit on the number of trust stores for your Amazon Web Services account.</p>\",\
      \"error\":{\
        \"code\":\"TooManyTrustStores\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TooManyUniqueTargetGroupsPerLoadBalancerException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You've reached the limit on the number of unique target groups per load balancer across all listeners. If a target group is used by multiple actions for a load balancer, it is counted as only one use.</p>\",\
      \"error\":{\
        \"code\":\"TooManyUniqueTargetGroupsPerLoadBalancer\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TotalRevokedEntries\":{\"type\":\"long\"},\
    \"TrustStore\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"TrustStoreName\",\
          \"documentation\":\"<p>The name of the trust store.</p>\"\
        },\
        \"TrustStoreArn\":{\
          \"shape\":\"TrustStoreArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trust store.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"TrustStoreStatus\",\
          \"documentation\":\"<p>The current status of the trust store.</p>\"\
        },\
        \"NumberOfCaCertificates\":{\
          \"shape\":\"NumberOfCaCertificates\",\
          \"documentation\":\"<p>The number of ca certificates in the trust store.</p>\"\
        },\
        \"TotalRevokedEntries\":{\
          \"shape\":\"TotalRevokedEntries\",\
          \"documentation\":\"<p>The number of revoked certificates in the trust store.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a trust store.</p>\"\
    },\
    \"TrustStoreArn\":{\"type\":\"string\"},\
    \"TrustStoreArns\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrustStoreArn\"}\
    },\
    \"TrustStoreAssociation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"TrustStoreAssociationResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the resources a trust store is associated with.</p>\"\
    },\
    \"TrustStoreAssociationResourceArn\":{\"type\":\"string\"},\
    \"TrustStoreAssociations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrustStoreAssociation\"}\
    },\
    \"TrustStoreInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified trust store is currently in use.</p>\",\
      \"error\":{\
        \"code\":\"TrustStoreInUse\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TrustStoreName\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1,\
      \"pattern\":\"^([a-zA-Z0-9]+-)*[a-zA-Z0-9]+$\"\
    },\
    \"TrustStoreNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrustStoreName\"}\
    },\
    \"TrustStoreNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified trust store does not exist.</p>\",\
      \"error\":{\
        \"code\":\"TrustStoreNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TrustStoreNotReadyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified trust store is not active.</p>\",\
      \"error\":{\
        \"code\":\"TrustStoreNotReady\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TrustStoreRevocation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrustStoreArn\":{\
          \"shape\":\"TrustStoreArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trust store.</p>\"\
        },\
        \"RevocationId\":{\
          \"shape\":\"RevocationId\",\
          \"documentation\":\"<p>The revocation ID of the revocation file.</p>\"\
        },\
        \"RevocationType\":{\
          \"shape\":\"RevocationType\",\
          \"documentation\":\"<p>The type of revocation file.</p>\"\
        },\
        \"NumberOfRevokedEntries\":{\
          \"shape\":\"NumberOfRevokedEntries\",\
          \"documentation\":\"<p>The number of revoked certificates.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a revocation file in use by a trust store.</p>\"\
    },\
    \"TrustStoreRevocations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrustStoreRevocation\"}\
    },\
    \"TrustStoreStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"CREATING\"\
      ]\
    },\
    \"TrustStores\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrustStore\"}\
    },\
    \"UnsupportedProtocolException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified protocol is not supported.</p>\",\
      \"error\":{\
        \"code\":\"UnsupportedProtocol\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"VpcId\":{\"type\":\"string\"},\
    \"ZoneName\":{\"type\":\"string\"}\
  },\
  \"documentation\":\"<fullname>Elastic Load Balancing</fullname> <p>A load balancer distributes incoming traffic across targets, such as your EC2 instances. This enables you to increase the availability of your application. The load balancer also monitors the health of its registered targets and ensures that it routes traffic only to healthy targets. You configure your load balancer to accept incoming traffic by specifying one or more listeners, which are configured with a protocol and port number for connections from clients to the load balancer. You configure a target group with a protocol and port number for connections from the load balancer to the targets, and with health check settings to be used when checking the health status of the targets.</p> <p>Elastic Load Balancing supports the following types of load balancers: Application Load Balancers, Network Load Balancers, Gateway Load Balancers, and Classic Load Balancers. This reference covers the following load balancer types:</p> <ul> <li> <p>Application Load Balancer - Operates at the application layer (layer 7) and supports HTTP and HTTPS.</p> </li> <li> <p>Network Load Balancer - Operates at the transport layer (layer 4) and supports TCP, TLS, and UDP.</p> </li> <li> <p>Gateway Load Balancer - Operates at the network layer (layer 3).</p> </li> </ul> <p>For more information, see the <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/\\\">Elastic Load Balancing User Guide</a>.</p> <p>All Elastic Load Balancing operations are idempotent, which means that they complete at most one time. If you repeat an operation, it succeeds.</p>\"\
}\
";
}

@end
