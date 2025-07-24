# operators-repo
registry for operators

# mirror operators

## install
1. extract tar files // mirror-worksapce.tar

  cat mirror-workspace.tar.gz.part-* | tar -xzv

2. push operators set

  oc mirror --config=imageset-config.yaml --from file://mirror-workspace docker://registry.ygs.quay:8443/init --v2 --dest-tls-verify=false

  ** replace url of registry
  
3. apply catalog to openshift

  oc apply -f ygs-community-catalogsource.yaml
  oc apply -f ygs-community-catalogsource-cert.yaml

  ** replace username and password auth for quay in ygs-community-catalogsource.yaml file 

4. check operator hub on openshift

## utilize command
 -- pull operators
 oc mirror --config=imageset-config.yaml file://mirror-workspace --v2
 
 -- remove catalog service
 oc delete catalogsource ygs-community-catalog -n openshift-marketplace
 oc delete catalogsource ygs-community-catalog-certified -n openshift-marketplace
 
 -- get catalogsource
 oc get catalogsource -n openshift-marketplace
 oc get pods -n openshift-marketplace
 oc get pods -n openshift-marketplace -l olm.catalogSource=ygs-community-catalog
 
 -- get log of catalogsource
 oc logs -f ygs-community-catalog-certified-twx65 -n openshift-marketplace
 
 -- check valid catalog
 oc mirror list operators --catalog=registry.ygs.quay:8443/init/redhat/community-operator-index:v4.14
 oc mirror list operators --catalog=registry.ygs.quay:8443/init/redhat/certified-operator-index:v4.14


# mirror additional images
1. extract tar files // mirror-worksapce-images.tar

  cat mirror-workspace-images.tar.gz.part-* | tar -xzv

2. push images set

  oc mirror --config=imageset-config-images.yaml --from file://mirror-workspace docker://registry.ygs.quay:8443 --v2 --dest-tls-verify=false

3. check quay
  
