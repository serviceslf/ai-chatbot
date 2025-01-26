interface WorkOrder {
  NUMCASO: number;
  TIPODOC: string;
  ESTADO: string;
  DESCESTADO: string;
  DESCRIPCION: string;
  RESPONSABLE: number;
  DESCRESPONSABLE: string;
  CLIENTE: number;
  DESCCLIENTE: string;
  SOLICITANTE: number;
  DESCSOLICITANTE: string;
  FECHA: string;
  FECHAFIN: string | null;
  TIPO: string;
  PRIORIDAD: string;
  FAMILIA: string;
  DESCFAMILIA: string;
  MODELO: string;
  DESCMODELO: string;
  NUMACTIVO: number;
  NUMUNIDAD: string;
  DESCACTIVO: string;
  SUCPLANTA: string;
  PROCESO: string;
  DESCPROCESO: string;
  SUBPROCESO: string;
  DESCSUBPROCESO: string;
  GRUPOPROV: number;
  DESCGRUPOPROV: string;
  SITIO: number;
  DESCSITIO: string;
}

interface WorkOrdersProps {
  workOrders?: WorkOrder[];
}

export function WorkOrders({ workOrders }: WorkOrdersProps) {
  if (!workOrders) {
    return (
      <div className="rounded-lg border border-border bg-background p-4 animate-pulse">
        <div className="h-6 w-48 bg-muted rounded mb-4"></div>
        <div className="space-y-4">
          <div className="h-24 bg-muted rounded"></div>
          <div className="h-24 bg-muted rounded"></div>
        </div>
      </div>
    );
  }

  return (
    <div className="rounded-lg border border-border bg-background p-4">
      <h3 className="mb-4 text-lg font-semibold">Pending Work Orders</h3>
      <div className="space-y-4">
        {workOrders.map((order) => (
          <div key={order.NUMCASO} className="rounded border border-border p-3">
            <div className="flex flex-wrap justify-between gap-2 mb-2">
              <div className="flex items-center gap-2">
                <span className="font-medium">Case #{order.NUMCASO}</span>
                <span className="text-sm px-2 py-1 rounded bg-secondary">
                  {order.DESCESTADO}
                </span>
              </div>
              <div className="text-sm">
                <span className="text-muted-foreground">Priority:</span>{' '}
                {order.PRIORIDAD.trim()}
              </div>
            </div>
            
            <p className="text-sm mb-3 font-medium">{order.DESCRIPCION}</p>
            
            <div className="grid sm:grid-cols-2 gap-2 text-sm">
              <div>
                <span className="text-muted-foreground">Asset:</span>{' '}
                {order.DESCACTIVO}
              </div>
              <div>
                <span className="text-muted-foreground">Model:</span>{' '}
                {order.DESCMODELO}
              </div>
              <div>
                <span className="text-muted-foreground">Area:</span>{' '}
                {order.DESCSUBPROCESO}
              </div>
              <div>
                <span className="text-muted-foreground">Responsible:</span>{' '}
                {order.DESCRESPONSABLE}
              </div>
              <div>
                <span className="text-muted-foreground">Client:</span>{' '}
                {order.DESCCLIENTE}
              </div>
              <div>
                <span className="text-muted-foreground">Date:</span>{' '}
                {new Date(order.FECHA).toLocaleDateString()}
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
