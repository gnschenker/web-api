using System.Collections.Generic;
using System.Web.Http;

namespace api.Controllers
{
    [Route("api/projects")]
    public class ProjectsController : ApiController
    {
        [HttpGet]
        public IEnumerable<Project> Get()
        {
            return new[]
            {
                new Project {id=1, name = "foo"},
                new Project {id=2, name = "bar"},
            };
        } 
    }

    public class Project
    {
        public int id { get; set; }
        public string name { get; set; }
    }
}
