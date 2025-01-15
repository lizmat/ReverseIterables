# Hopefully part of Raku core at some point
use nqp;
use ForwardIterables:ver<0.0.3+>:auth<zef:lizmat>;

my class ReverseIterator does Iterator {
    has     $!reified;
    has int $!i;

    method new($iterator) {
        $iterator.push-all(
          my $reified := nqp::create(IterationBuffer)
        );

        my $self := nqp::create(self);
        nqp::bindattr(  $self,self,'$!reified',$reified);
        nqp::bindattr_i($self,self,'$!i',nqp::elems($reified));
        $self
    }

    method pull-one() is raw {
        $!i
          ?? nqp::atpos($!reified,--$!i)
          !! IterationEnd
    }

    method push-all(\target --> IterationEnd) {
        my $reified = $!reified;
        my int $i   = $!i;

        target.push($reified.AT-POS(--$i)) while $i;
    }
}

class ReverseIterables is ForwardIterables {

    method next-iterator() is implementation-detail {
        my $next :=
          nqp::pop(nqp::getattr(self,ForwardIterables,'$!iterables'));

        nqp::bindattr(self,ForwardIterables,'$!current',
          nqp::istype($next,List)
            ?? $next.reverse.iterator  # Lists optimized to not need reifying
            !! ReverseIterator.new(
                 nqp::istype($next,Iterator) ?? $next !! $next.iterator
               )
        );
        self
    }
}

# vim: expandtab shiftwidth=4
