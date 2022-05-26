devhub=me

org:
	@sfdx force:org:create \
		--definitionfile ./config/project-scratch-def.json \
		--setalias scratch_fixtures \
		--setdefaultusername \
		--type scratch \
		--targetdevhubusername "$(devhub)"
	
open:
	@sfdx force:org:open

push:
	@sfdx force:source:push

pull:
	@sfdx force:source:pull

test:
	@sfdx force:apex:test:run \
		--codecoverage \
		--testlevel RunLocalTests \
		--resultformat human \
		--wait 10
