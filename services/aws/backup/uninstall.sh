#!/bin/ash

echo "Deleting all AWS Backup Resources----"

kubectl delete framework.backup.aws.upbound.io --all
kubectl delete globalsettings.backup.aws.upbound.io --all
kubectl delete plan.backup.aws.upbound.io --all
kubectl delete regionsettings.backup.aws.upbound.io --all
kubectl delete reportplan.backup.aws.upbound.io --all
kubectl delete selection.backup.aws.upbound.io --all
kubectl delete vaultlockconfiguration.backup.aws.upbound.io --all
kubectl delete vaultnotifications.backup.aws.upbound.io --all
kubectl delete vaultpolicy.backup.aws.upbound.io --all
kubectl delete vault.backup.aws.upbound.io --all

echo "---Complete!!"