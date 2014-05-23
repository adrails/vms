module ApplicationHelper
	#~ def disable_assigned_services(vendor)
		#~ Project.find_all.map(&:services_ids)
		#~ @invite_lists = InviteList.find_all_by_vendor_id(vendor)
		#~ @project = []
		#~ @invite_lists && @invite_lists.each do |f|
			#~ @project << f.project_id
		#~ end
		#~ @services = []
		#~ @project.each do |f|
			#~ @services << f.services_ids
		#~ end
		#~ @services.flatten
	#~ end
end
