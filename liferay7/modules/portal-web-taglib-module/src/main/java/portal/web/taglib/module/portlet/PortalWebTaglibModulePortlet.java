package portal.web.taglib.module.portlet;

import com.liferay.portal.deploy.hot.CustomJspBag;
import com.liferay.portal.kernel.url.URLContainer;

import java.net.URL;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.osgi.framework.Bundle;
import org.osgi.framework.BundleContext;
import org.osgi.service.component.annotations.Activate;
import org.osgi.service.component.annotations.Component;

@Component(
    immediate = true,
    property = {
        "context.id=PortalWebTaglibModulePortlet",
        "context.name=Portal Web Taglib JSP Bag",
        "service.ranking:Integer=101"
    }
)
public class PortalWebTaglibModulePortlet implements CustomJspBag {
		@Override
		public String getCustomJspDir() {
			return "META-INF/resources/";
		}

		@Override
		public List<String> getCustomJsps() {
			return _customJsps;
		}

		@Override
		public URLContainer getURLContainer() {
			return _urlContainer;
		}

		@Override
		public boolean isCustomJspGlobal() {
			return true;
		}

		@Activate
		protected void activate(BundleContext bundleContext) {
			bundle = bundleContext.getBundle();

			_customJsps = new ArrayList<>();

			Enumeration<URL> entries = bundle.findEntries(
				getCustomJspDir(), "*.jsp", true);

			while (entries.hasMoreElements()) {
				URL url = entries.nextElement();

				_customJsps.add(url.getPath());
			}
		}

		private List<String> _customJsps;

		private final URLContainer _urlContainer = new URLContainer() {

			@Override
			public Set<String> getResources(String path) {
				Set<String> paths = new HashSet<>();

				for (String entry : _customJsps) {
					if (entry.startsWith(path)) {
						paths.add(entry);
					}
				}

				return paths;
			}

			@Override
			public URL getResource(String name) {
				return bundle.getEntry(name);
			}

		};

		private Bundle bundle;
}
