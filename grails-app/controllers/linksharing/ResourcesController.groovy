package linksharing

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ResourcesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Resources.list(params), model:[resourcesCount: Resources.count()]
    }

    def show(Resources resources) {
        respond resources
    }

    def create() {
        respond new Resources(params)
    }

    @Transactional
    def save(Resources resources) {
        if (resources == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (resources.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond resources.errors, view:'create'
            return
        }

        resources.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'resources.label', default: 'Resources'), resources.id])
                redirect resources
            }
            '*' { respond resources, [status: CREATED] }
        }
    }

    def edit(Resources resources) {
        respond resources
    }

    @Transactional
    def update(Resources resources) {
        if (resources == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (resources.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond resources.errors, view:'edit'
            return
        }

        resources.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'resources.label', default: 'Resources'), resources.id])
                redirect resources
            }
            '*'{ respond resources, [status: OK] }
        }
    }

    @Transactional
    def delete(Resources resources) {

        if (resources == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        resources.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'resources.label', default: 'Resources'), resources.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'resources.label', default: 'Resources'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
