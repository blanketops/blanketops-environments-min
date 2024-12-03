#!/bin/ash

echo "Deleting all AWS EC2 Resources----"
#5
kubectl delete amicopy.ec2.aws.upbound.io --all
kubectl delete amilaunchpermission.ec2.aws.upbound.io --all
kubectl delete ami.ec2.aws.upbound.io --all
kubectl delete availabilityzonegroup.ec2.aws.upbound.io --all

#10
kubectl delete capacityreservation.ec2.aws.upbound.io --all
kubectl delete carriergateway.ec2.aws.upbound.io --all
kubectl delete customergateway.ec2.aws.upbound.io --all
kubectl delete defaultnetworkacl.ec2.aws.upbound.io --all
kubectl delete defaultroutetable.ec2.aws.upbound.io --all

#15
kubectl delete defaultsecuritygroup.ec2.aws.upbound.io --all
kubectl delete defaultsubnet.ec2.aws.upbound.io --all
kubectl delete defaultvpcdhcpoptions.ec2.aws.upbound.io --all
kubectl delete defaultvpc.ec2.aws.upbound.io --all

#20
kubectl delete defaultkmskey.ec2.aws.upbound.io --all
kubectl delete ebsnapshotcopy.ec2.aws.upbound.io --all
kubectl delete ebssnapshotimport.ec2.aws.upbound.io --all
kubectl delete egressonlyinternetgateway.ec2.aws.upbound.io --all
kubectl delete eipassociation.ec2.aws.upbound.io --all

#25
kubectl delete eip.ec2.aws.upbound.io --all
kubectl delete encryptionbydefault.ec2.aws.upbound.io --all
kubectl delete fleet.ec2.aws.upbound.io --all
kubectl delete flowlog.ec2.aws.upbound.io --all
kubectl delete host.ec2.aws.upbound.io --all

#30
kubectl delete instancestate.ec2.aws.upbound.io --all
kubectl delete instance.ec2.aws.upbound.io --all
kubectl delete internetgateway.ec2.aws.upbound.io --all
kubectl delete keypair.ec2.aws.upbound.io --all
kubectl delete launchtemplate.ec2.aws.upbound.io --all

#35
kubectl delete mainroutetableassociation.ec2.aws.upbound.io --all
kubectl delete managedprefixlistentry.ec2.aws.upbound.io --all
kubectl delete managedprefixlist.ec2.aws.upbound.io --all
kubectl delete natgateway.ec2.aws.upbound.io --all
kubectl delete networkacl.ec2.aws.upbound.io --all

#40
kubectl delete networkaclrule.ec2.aws.upbound.io --all
kubectl delete networkinsightsanalysis.ec2.aws.upbound.io --all
kubectl delete networkinsightspath.ec2.aws.upbound.io --all
kubectl delete networkinterfaceattachment.ec2.aws.upbound.io --all
kubectl delete networkinterfacesgsattachment.ec2.aws.upbound.io --all

#45
kubectl delete networkinterface.ec2.aws.upbound.io --all
kubectl delete placementgroup.ec2.aws.upbound.io --all
kubectl delete routetableassociation.ec2.aws.upbound.io --all
kubectl delete routetable.ec2.aws.upbound.io --all
kubectl delete route.ec2.aws.upbound.io --all

#50
kubectl delete securitygroupegressrule.ec2.aws.upbound.io --all
kubectl delete securityingressrule.ec2.aws.upbound.io --all
kubectl delete securitygroup.ec2.aws.upbound.io --all
kubectl delete serialconsoleacess.ec2.aws.upbound.io --all
kubectl delete snapshotcreatevolumepermission.ec2.aws.upbound.io --all

#55
kubectl delete spotfleetrequest.ec2.aws.upbound.io --all
kubectl delete spotinstancerequest.ec2.aws.upbound.io --all
kubectl delete subnetcidrreservation.ec2.aws.upbound.io --all
kubectl delete subnet.ec2.aws.upbound.io --all
kubectl delete tag.ec2.aws.upbound.io --all

#60
kubectl delete trafficmonitorfilterrule.ec2.aws.upbound.io --all
kubectl delete trafficmonitorfilter.ec2.aws.upbound.io --all
kubectl delete transitgatewayconnectpeer.ec2.aws.upbound.io --all
kubectl delete transitgatewayconnect.ec2.aws.upbound.io --all
kubectl delete transitgatewayprefixlistreference.ec2.aws.upbound.io --all


#65
kubectl delete transitgatewaymulticastdomainassociation.ec2.aws.upbound.io --all
kubectl delete transitgatewaymulticastdomain.ec2.aws.upbound.io --all
kubectl delete transitgatewaymulticastgroupmember.ec2.aws.upbound.io --all
kubectl delete transitgatewaymulticastgroupsource.ec2.aws.upbound.io --all
kubectl delete transitgatewaypeeringattachmentaccepter.ec2.aws.upbound.io --all

#70
kubectl delete transitgatewaypeeringattachment.ec2.aws.upbound.io --all
kubectl delete transitgatewaypolicytable.ec2.aws.upbound.io --all
kubectl delete transitgatewayroutetableassociation.ec2.aws.upbound.io --all
kubectl delete transitgatewayroutetablepropagation.ec2.aws.upbound.io --all
kubectl delete transitgatewayroutetable.ec2.aws.upbound.io --all

#75
kubectl delete transitgatewayroute.ec2.aws.upbound.io --all
kubectl delete transitgatewayvpcattachmentaccepter.ec2.aws.upbound.io --all
kubectl delete transitgatewayvpcattachment.ec2.aws.upbound.io --all
kubectl delete transitgateway.ec2.aws.upbound.io --all
kubectl delete vpcendpointconnectionnotification.ec2.aws.upbound.io --all

#80
kubectl delete vpcendpointrouretableassociation.ec2.aws.upbound.io --all
kubectl delete vpcendpointsecuritygroupassociation.ec2.aws.upbound.io --all
kubectl delete vpcendpointserviceallowedprincipal.ec2.aws.upbound.io --all
kubectl delete vpcendpoint.ec2.aws.upbound.io --all
kubectl delete vpcipampoolcidrallocation.ec2.aws.upbound.io --all


#85
kubectl delete vpcipampoolcidr.ec2.aws.upbound.io --all
kubectl delete vpcipampool.ec2.aws.upbound.io --all
kubectl delete vpcipampoolscope.ec2.aws.upbound.io --all
kubectl delete vpcipam.ec2.aws.upbound.io --all

#90
kubectl delete vpcipv4cidrblockassociation.ec2.aws.upbound.io --all
kubectl delete volumeattachment.ec2.aws.upbound.io --all
kubectl delete vpcconnectionroute.ec2.aws.upbound.io --all
kubectl delete vpcconnection.ec2.aws.upbound.io --all

#95
kubectl delete vpcdhcpoptionsassociation.ec2.aws.upbound.io --all
kubectl delete vpcdhcpoptions.ec2.aws.upbound.io --all
kubectl delete vpcpeeringconnectionaccepter.ec2.aws.upbound.io --all
kubectl delete vpcpeeringconnectionoptions.ec2.aws.upbound.io --all

#100
kubectl delete vpc.ec2.aws.upbound.io --all
kubectl delete vpngatewayattachment.ec2.aws.upbound.io --all
kubectl delete vpngatewayroutepropagation.ec2.aws.upbound.io --all
kubectl delete vpngateway.ec2.aws.upbound.io --all


kubectl delete scalingplan.ec2.aws.upbound.io --all
kubectl delete scalingplan.ec2.aws.upbound.io --all
kubectl delete scalingplan.ec2.aws.upbound.io --all
kubectl delete scalingplan.ec2.aws.upbound.io --all
kubectl delete scalingplan.ec2.aws.upbound.io --all
kubectl delete scalingplan.ec2.aws.upbound.io --all

kubectl delete scalingplan.ec2.aws.upbound.io --all


echo "---Complete!!"