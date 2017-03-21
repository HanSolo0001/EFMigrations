using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComicBookGalleryModel.Models
{
    public class ComicBookAverageRating
    {
        public int Id { get; set; }
        public int ComicBookId { get; set; }
        public decimal AverageRating { get; set; }
        public DateTime Date { get; set; }

        /// <summary>
        /// comic book navigation property associating the one-to-many relationship between comic books and their average ratings. Comic books are the one; one comic book can have multiple ratings, which is why the AverageRating class is the many part of the relationship.
        /// </summary>
        public ComicBook ComicBook { get; set; }
    }
}
